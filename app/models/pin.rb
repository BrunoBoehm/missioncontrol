class Pin < ActiveRecord::Base
	has_many :board_pins
	has_many :boards, through: :board_pins

	has_many :perso_links
	has_many :people, through: :perso_links
	
	has_many :pro_links, dependent: :delete_all
	has_many :companies, through: :pro_links

	include Taggable

	accepts_nested_attributes_for :people, reject_if: proc { |attributes| attributes['name'].blank? && attributes['surname'].blank? }, allow_destroy: true

	accepts_nested_attributes_for :companies, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

	default_scope { where(account_id: Account.current_id) }

	validates :title, presence: true

	def self.latest
		order(updated_at: :desc)
	end

	def companies_attributes=(attributes)
		attributes.each do |i, attribute|
			if attribute[:_destroy] == "1"
				self.pro_links.find_by(company_id: attribute[:id]).destroy
			else
				company_name = attribute["name"]
				company = Company.where('lower(name) = ?', company_name.downcase).first_or_create(name: company_name) unless company_name.empty?
				self.companies << company unless self.companies.include?(company) || company.nil?
			end
		end
	end

	def people_attributes=(attributes)
		attributes.each do |i, attribute|
			if attribute[:_destroy] == "1"
				self.perso_links.find_by(person_id: attribute[:id]).destroy
			else
				person_name = attribute["name"]
				person = Person.where('lower(name) = ?', person_name.downcase).first_or_create(name: person_name) unless (person_name.empty?)
				self.people << person unless self.people.include?(person) || person.nil?
			end
		end
	end

	# def people_attributes=(attributes)
	# 	attributes.each do |i, attribute|
	# 		person_name = attribute["name"]
	# 		person_surname = attribute["surname"]
	# 		person = Person.find_or_create_by(name: person_name, surname: person_surname)
	# 		@perso_link = self.perso_links.find_or_initialize_by(person_id: person.id, pin_id: self.id)
	# 	end
	# end

	# def company_names=(names)
	# 	names.split(",").map(&:strip).each do |company_name|
	# 		company = Company.where('lower(name) = ?', company_name.downcase).first_or_create(name: company_name)
	# 		pro_link = self.pro_links.find_or_create_by(company_id: company.id, pin_id: self.id)
	# 	end
	# end

	# def company_names
	# 	self.companies.map(&:name).join(", ")
	# end

end
