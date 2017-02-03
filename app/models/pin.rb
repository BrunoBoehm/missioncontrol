class Pin < ActiveRecord::Base
	has_many :board_pins
	has_many :boards, through: :board_pins

	has_many :perso_links
	has_many :people, through: :perso_links
	
	has_many :pro_links
	has_many :companies, through: :pro_links

	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings

	accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
	accepts_nested_attributes_for :people, reject_if: proc { |attributes| attributes['name'].blank? || attributes['surname'].blank? }
	accepts_nested_attributes_for :companies, reject_if: proc { |attributes| attributes['name'].blank? }
	default_scope { where(account_id: Account.current_id) }

	# "companies_attributes"=>{"0"=>{"name"=>"Apple"}}, "people_attributes"=>{"0"=>{"name"=>"Petit ", "surname"=>"Prince"}}

	def companies_attributes=(attributes)
		attributes.each do |i, attribute|
			company_name = attribute["name"]
			company = Company.where('lower(name) = ?', company_name.downcase).first_or_create(name: company_name)
			pro_link = self.pro_links.find_or_create_by(company_id: company.id, pin_id: self.id)
		end
	end

	def people_attributes=(attributes)
		attributes.each do |i, attribute|
			person_name = attribute["name"]
			person_surname = attribute["surname"]
			person = Person.find_or_create_by(name: person_name, surname: person_surname)
			perso_link = self.perso_links.find_or_create_by(person_id: person.id, pin_id: self.id)
		end
	end

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
