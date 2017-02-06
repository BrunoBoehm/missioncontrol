module PinsHelper

	def images(pin)
		if pin.imgs.empty?
			["http://placehold.it/350x150"]
		else
			pin.imgs.split("\r\n").select{ |x| x.match(/(\.jpg|\.png|\.jpeg|\.gif)$/i) }
		end
	end

	def is_video?(url)
		if is_youtube_video?(url)
			video_from_yt_url(url)
		elsif is_vimeo_video?(url)
			video_from_vimeo_url(url)
		else
			false
		end
	end

	def is_youtube_video?(url)
		!!!url.scan(/youtube\.com/i).empty?
	end

	def is_vimeo_video?(url)
		!!!url.scan(/vimeo\.com/i).empty?
	end	

	def video_from_yt_url(url)
		src = url.split("?v=").last
		"https://www.youtube.com/embed/" + src + "?rel=0&amp;showinfo=0"
	end

	def youtube_ref_from_url(url)
		url.split("?v=").last
	end

	def video_from_vimeo_url(url)
		src = url.split("/").last
		"https://player.vimeo.com/video/" + src
	end

	def vimeo_thumnail(url)
		# no easy way without API.
	end

	def youtube_thumbnail(url)
		"https://i.ytimg.com/vi/#{youtube_ref_from_url(url)}/maxresdefault.jpg"
	end

	def clean(text)
		text.gsub(/<p>|<a.*?>|<\/a>|<\/p>/i, "")
	end

end
