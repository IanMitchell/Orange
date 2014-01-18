class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  belongs_to :user
  belongs_to :buyer, class_name: 'User'
  has_many :reviews

  enum status: {
    open: 0,
    completed: 1,
    old: 2
  }



  validates :title,         presence: true

  validates :description,   presence: true


  scope :completed, -> {
    where('status <> ?', STATUS[:completed])
  }
end
