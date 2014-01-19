module ApplicationHelper
	def get_gravatar(user,size=150)
	 "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}.jpg?s={size}"
	end
end
