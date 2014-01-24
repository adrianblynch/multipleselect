MultipleSelect
=============

Change a multiple select into something a little friendlier to use.

Background
----------

There are other jQuery plugins that do much the same as this. Where I feel they were lacking is in their lack of simplicity, destruction of the DOM and usage of id and class attributes.

Environment
-----------

Originally built with jQuery 1.8.3.

Coding style
------------

This is not a jQuery plugin but it does make use of jQuery.

Quick start
-----------

Download and include multipleselect.js and jQuery (the one in this project or your own) in you page.

Place a multiple select element in your page:

`<select multiple="multiple">
	<option value="1">One</option>
	<option value="2">Two</option>
	<option value="3" selected="selected">Three</option>
	<option value="4" selected="selected">Four</option>
</select>`

Use the following:

`var select = $("select");
var ms = new MultipleSelect(select);`

If all went well, you should see two lists. When you click an item in either list, it will move to the other.

Still to come
-------------

- Basic CSS to style the default DOM
- CSS to stop text selection in example page
- Tab into the two divs to give focus
- Once in the divs, use arrows to move up and down, with spacebar indicating a click
- Test with touch (works on Windows 8)