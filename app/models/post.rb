class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  belongs_to :user
  belongs_to :buyer, class_name: 'user'

  enum status: {
    open: 0,
    completed: 1,
    old: 2
  }


  def can_post
    #TODO: Check for any completed posts without reviews
  end
end
