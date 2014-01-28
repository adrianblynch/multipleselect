<!---
	A generic user picker which results in a form field of some description filled with client IDs, ready to be submitted.
--->

<script type="text/javascript" src="/core/webcore/js/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/core/webcore/js/multipleselect.js"></script>
<!---
<script>
	$(function() {

		var users = $("select[name='users']");
		var usersMS =  new MultipleSelect(users);
		var userSearch = $("input[name='userSearch']")

		userSearch.keyup(function(e) {

			var value = e.target.value;

			if (value.length < 1) {
				return false;
			}

			if (keyup.cache[value] == null) {

				var req = $.ajax({
					url: "/core/objects/jobManagement/JobManagement.cfc?method=users&returnFormat=json",
					dataType: "json",
					data: {
						searchTerm: value
					}
				});

				req.done(function(res) {

					// Remove non-selected options
					$("option:not(:selected)", users).remove();

					$.each(res, function(i, obj) {
						usersMS.addOption(obj.id, obj.title);
					});

					usersMS.refresh();

				});

			}

		});

		$("#getThemIDs").click(function(e) {
			e.preventDefault();
			console.log("The chosen ones are...", users.val());
		})

	});
</script>
<style>
	#daSelector div.selected,
	#daSelector div.selectable {
		border: solid 1px #ccc;
		width: 360px;
		height: 240px;
		float: left;
		overflow-y: auto;
		border-radius: 3px;
		margin-left: 25px;
	}
	#daSelector div.selected li,
	#daSelector div.selectable li {
		padding: 10px;
		cursor: pointer;
	}
	#daSelector div.selected li.hover,
	#daSelector div.selectable li.hover {
		background-color: #08c;
		color: #eee;
	}
	#daSelector div.teams h3.selectable {
		float: left;
		width: 360px;
		margin-left: 25px;
	}
	#daSelector div.teams h3.selected {
		float: left;
		width: 360px;
		margin-left: 25px;
	}
	#daSelector input {
		border: solid 1px #ccc;
		width: 352px;
		border-radius: 3px;
		margin-left: 25px;
		padding: 4px;
	}

</style>

<h2>Jobs/Users/Whatevers Search</h2>

<div id="daSelector">
	<h3 class="selectable">Available jobs</h3>
	<h3 class="selected">Selected jobs</h3>
	<div style="overflow: hidden; float:left; width: 100%;">
		<input type="text" name="userSearch" autocomplete="off" placeholder="Search for jobs with titles here..." style="width: 300px;" />
	</div>
	<select name="users" multiple="multiple"></select>
</div>

<div>
	<button id="getThemIDs">Which ones are selected?</button>
</div>
--->

<!--- --------------------------------------------------------------------------------------------------------------- --->

<h2 style="clear: both; width: 100%;">Basic MultipleSelect jQuery example</h2>

<p>STEPS:</p>

<ul>
	<li>Place a multiple select in the DOM</li>
	<li>Invoke with: var myMultipleSelect =  new MultipleSelect(jQuery object|DOM node|selector);</li>
</ul>

<p>TODO:</p>

<ul>
	<li>Tab into the two divs</li>
	<li>Once in the divs, use arrows to move up and down, with spacebar indicating a click</li>
	<li>Test with touch (works on Windows 8)</li>
	<li>CSS to stop text selection</li>
</ul>

<input />

<div id="staticStuff">
	<select name="stuff" multiple="multiple">
		<option value="1">Option 1</option>
		<option value="2">Option 2</option>
		<option value="3">Option 3</option>
		<option value="4">Option 4</option>
		<option value="5">Option 5</option>
		<option value="6">Option 6</option>
		<cfloop from="7" to="100" index="i"><cfoutput>
			<option value="#i#">Option #i#</option>
		</cfoutput></cfloop>
	</select>
	<button id="getStuffIDs">Which ones were selected?</button>
</div>

<script>
	$(function() {

		var stuff = $("select[name='stuff']");
		var stuffMS =  new MultipleSelect(stuff);

		$("#getStuffIDs").click(function(e) {
			e.preventDefault();
			console.log("The chosen ones are...", stuff.val());
		})

		stuffMS.refresh();

	});
</script>

<style>
	#staticStuff ul {
		list-style: none;
		margin: 0px;
		padding: 0px;
	}
	#staticStuff div.selected,
	#staticStuff div.selectable {
		border: solid 1px #ccc;
		width: 360px;
		height: 240px;
		float: left;
		overflow-y: auto;
		border-radius: 3px;
		margin-left: 25px;
	}
	#staticStuff div.selected li,
	#staticStuff div.selectable li {
		padding: 10px;
		cursor: pointer;
	}
	#staticStuff div.selected li.hover,
	#staticStuff div.selectable li.hover {
		background-color: #08c;
		color: #eee;
	}
</style>