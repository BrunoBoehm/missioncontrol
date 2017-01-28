class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.string :fb_url
      t.string :tw_url
      t.string :ln_url
      t.string :ig_url
      t.string :yt_url
      t.string :db_url
      t.integer :person_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
