class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  enum status: {
    open: 0,
    completed: 1,
    old: 2
  }
end
