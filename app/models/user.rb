class User < ActiveRecord::Base

def self.from_omniauth(auth)
	# user = User.new(user_params)
    where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_initialize.tap do |user|
      # user = User.new(user_params)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end


end