MultipleSelect = function(select, options) {

	/*
		Turns a <select multiple="multiple"> element into a better looking UI.
		Inspired by the one found here: http://loudev.com/, the aim is to produce a lighter version with less mark-up and ID/class usage.
		No styling is applied.
	*/

	/*
		- Let's assume that the options will have a value and that at the end, the use wants to look at the select to get all those that have been selected
		- The UI should not be touched
		- No optimisations are in place... yet!
		- Extra requirements:
			- The ability to allow mark-up in the UI items:
				- Mark-up in the option tag - Nasty!
				- Mark-up in the option's data - Sounds heavy
				- An object which maps the value to the mark-up? Could just work
			- Allow the order to be changed:
				- Drag 'n' drop
				- Up and down arrows
		- Possible changes:
			- Maintain the order as the items pass back and forth as the options order is followed at the moment
		- Possible optimisations:
			- Group creation of HTML and add to the DOM in one hit
			- Use native JS in place of jQuery
			- Don't call refresh() every time itemClicked() is called, instead, move items manually
		- Add events for:
			- On selected
			- On unselected
	*/

	select = $(select);
	options = options || {
		selectableClass: "selectable",
		selectedClass: "selected",
		itemHoverClass: "hover",
		markUpMap: {}
	};

	if (select.length !== 1) throw "No select element was supplied to MultipleSelect()";

	var self = this;
	var selectableClass = options.selectableClass;
	var selectedClass = options.selectedClass;
	var itemHoverClass = options.itemHoverClass;
	var markUpMap = options.markUpMap;

	// Hide the select
	select.hide();

	// Create two panes
	var selectableItems = $("<div class='" + selectableClass + "'><ul></ul></div>");
	var selectedItems = $("<div class='" + selectedClass + "'><ul></ul></div>");

	// Place the lists after the select
	select.after(selectedItems).after(selectableItems);

	selectableItems.on("click", "li", function(e) {
		itemClicked(this);
	});

	selectedItems.on("click", "li", function(e) {
		itemClicked(this);
	});

	selectableItems.on("mouseover", "li", function(e) {
		$(this).addClass(itemHoverClass);
	}).on("mouseout", "li", function(e) {
		$(this).removeClass(itemHoverClass);
	});

	selectedItems.on("mouseover", "li", function(e) {
		$(this).addClass(itemHoverClass);
	}).on("mouseout", "li", function(e) {
		$(this).removeClass(itemHoverClass);
	});

	self.refresh = function() {

		// Update the UI based on the current state of the select

		// Clear the UI
		$("ul", selectableItems).html("");
		$("ul", selectedItems).html("");

		// For each option, create an item and place in the correct list
		$("option", select).each(function(i, option) {

			if (option.selected) {
				addSelected(createItem(option));
			} else {
				addSelectable(createItem(option));
			}

		});

	};

	self.addOption = function(value, text, selected) {

		if (selected === undefined) selected = false;

		// Ignore if it already exists in the select
		if ($("option[value='" + value + "']", select).length === 0) {
			var option = "<option value='" + value + "'" + (selected ? " selected='selected'" : "") + ">" + text + "</option>";
			select.append(option);
		}

	};

	function itemClicked(item) {
		var $item = $(item);
		var value = $item.data("value");
		$("option[value='" + value + "']", select).get(0).selected = $item.closest("div").hasClass(selectableClass);
		self.refresh();
	}

	function createItem(option) {
		return $("<li>" + (markUpMap[option.value] || option.text) + "</li>").data("value", option.value);
	}

	function addSelectable(item) {
		$("ul", selectableItems).append(item);
	}

	function addSelected(item) {
		$("ul", selectedItems).append(item);
	}

	// Initialise
	self.refresh();

}