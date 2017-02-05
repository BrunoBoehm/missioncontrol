class AddProfilableToSocialProfiles < ActiveRecord::Migration
  def change
  	add_column :social_profiles, :profilable_id, :integer
  	add_column :social_profiles, :profilable_type, :string
  	remove_column :social_profiles, :person_id
  	remove_column :social_profiles, :company_id
  	add_index :social_profiles, [:profilable_id, :profilable_type]
  end
end