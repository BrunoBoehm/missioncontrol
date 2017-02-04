module ApplicationHelper

	def link_to_add_fields(name, f, association)
		# first we build an instance of the association record
					 # @pin.companies.klass.new
		new_object = f.object.send(association).klass.new
		# generate a unique value that we'll use later on
		id = new_object.object_id

		# build a regular nested field with the above info
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			# ask to look for the template (meta-programmed)
			render("add_" + association.to_s.singularize, f: builder)
		end

		# we the  store all of that data into a link that we will trigger with javascript
		# on the fields variable we do the html escaping
		link_to(name, "#", class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
		# turbolinks would be a problem
	end
end
