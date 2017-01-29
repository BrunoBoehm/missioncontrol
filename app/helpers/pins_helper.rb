module PinsHelper

	def images(pin)
		pin.imgs.split("\r\n").select{ |x| x.match(/(\.jpg|\.png|\.jpeg|\.gif)$/i) }
	end

end
