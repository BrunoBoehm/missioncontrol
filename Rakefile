# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :admin do
	desc "merge the name and surname fields for people"
	task :merge_name => :environment do
		people = Person.unscoped
		people.each do |person|
			person.name += " #{person.surname}"
			person.save
		end
		puts "#{people.length} people updated"
	end	
end
