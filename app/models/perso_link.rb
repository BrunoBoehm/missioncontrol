class PersoLink < ActiveRecord::Base
	belongs_to :pin
	belongs_to :person
end
