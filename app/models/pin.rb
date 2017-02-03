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
