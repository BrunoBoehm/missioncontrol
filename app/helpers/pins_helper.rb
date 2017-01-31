module PinsHelper

	def images(pin)
		if pin.imgs
			pin.imgs.split("\r\n").select{ |x| x.match(/(\.jpg|\.png|\.jpeg|\.gif)$/i) }
		else
			["http://placehold.it/350x150"]
		end
	end

end
