class AddSiteAndBlogToSocialProfiles < ActiveRecord::Migration
  def change
    add_column :social_profiles, :site_url, :string
    add_column :social_profiles, :blog_url, :string
    add_column :social_profiles, :med_url, :string
  end
end
