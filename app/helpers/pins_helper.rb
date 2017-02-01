module PinsHelper

	def images(pin)
		if pin.imgs.empty?
			["http://placehold.it/350x150"]
		else
			pin.imgs.split("\r\n").select{ |x| x.match(/(\.jpg|\.png|\.jpeg|\.gif)$/i) }
		end
	end

	def is_video?(url)
		url.scan(/youtube/i) != [] ? true : false
	end

	def video_from_url(url)
		url.split("?v=").last
	end

end
