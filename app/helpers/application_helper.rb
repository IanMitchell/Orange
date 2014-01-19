module ApplicationHelper
	def get_gravatar(user,size=150)
    unless user.nil?
  	 "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}.jpg?s=#{size}"
    end
	end
end
