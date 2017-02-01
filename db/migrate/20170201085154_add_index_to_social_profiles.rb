class AddIndexToSocialProfiles < ActiveRecord::Migration
  def change
  	add_index :social_profiles, :person_id
  	add_index :social_profiles, :company_id
  end
end
