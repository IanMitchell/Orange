module ApplicationHelper
	def get_gravatar(user)
	 "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}.jpg"
	end
end
