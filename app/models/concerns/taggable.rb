module Taggable
	extend ActiveSupport::Concern

	included do
		has_many :taggings, as: :taggable, dependent: :delete_all
		has_many :tags, through: :taggings
	end

	def tag_names=(names)
		unless names.empty?
			names.split(',').map(&:strip).map(&:titleize).each do |name|
				tag = Tag.where('lower(name) = ?', name.downcase).first_or_create(name: name)
				self.tags << tag unless self.tags.include?(tag)
			end
		end
	end

	def tag_names
		self.tags.map(&:name)
	end
	
end
