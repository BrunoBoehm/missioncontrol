class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates_presence_of :name, :surname    
  belongs_to :account   

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.first_name
	    user.surname = auth.info.last_name
	    # If you are using confirmable and the provider(s) you use validate emails, 
	    # uncomment the line below to skip the confirmation emails.
	    # user.skip_confirmation!

	# => {"provider"=>"facebook",
	#  "uid"=>"10154896563440027",
	#  "info"=>{"email"=>"bruno.boehm@gmail.com", "name"=>"Bruno Boehm", "first_name"=>"Boehm", "last_name"=>"Bruno", "image"=>"http://graph.facebook.com/v2.6/10154896563440027/picture"},
	#  "credentials"=>
	#   {"token"=>"...",
	#    "expires_at"=>1495295402,
	#    "expires"=>true},
	#  "extra"=>{"raw_info"=>{"email"=>"bruno.boehm@gmail.com", "name"=>"Bruno Boehm", "first_name"=>"Boehm", "last_name"=>"Bruno", "gender"=>"male", "id"=>"10154896563440027"}}}
	  end
	end

end
