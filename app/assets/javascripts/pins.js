$(document).ready(initTinyMCE)

function initTinyMCE() {
	tinymce.init({ 
	  selector:'textarea.editor',
	  menubar: false,
	  plugins: [
	  'autolink lists link preview',
	  'table contextmenu paste code'
	  ],
	  statusbar: false,
	  style_formats: [
	    {title: "Bold", icon: "bold", format: "bold"},
	    {title: "Italic", icon: "italic", format: "italic"},
	    {title: "Blockquote", format: "blockquote"}
	  ],
	  toolbar: 'removeformat undo redo preview code | styleselect bold italic table | bullist numlist outdent indent | link'
	});
}
