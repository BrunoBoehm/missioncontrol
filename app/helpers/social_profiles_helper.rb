module SocialProfilesHelper
	def facebook_url(slug)
		"http://www.facebook.com/" + slug
	end

	def twitter_url(slug)
		"http://www.twitter.com/" + slug
	end

	def linkedin_url(slug)
		"http://www.linkedin.com/company/" + slug
	end

	def instagram_url(slug)
		"http://www.instagram.com/" + slug
	end

	def youtube_url(slug)
		"http://www.youtube.com/user/" + slug
	end

	def dribbble_url(slug)
		"http://www.dribbble.com/" + slug
	end

	def medium_url(slug)
		"http://www.medium.com/" + slug
	end

end
