class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :owner, class_name: 'user'


  validates :feedback,    presence: true,
                          length: { in: 3..256 }

  enum :score {
    neutral: 0,
    negative: -1,
    positive: 1
  }
end
