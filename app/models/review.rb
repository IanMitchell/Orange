class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :owner, class_name: 'user'


  validates :user_id,  presence: true
  validates :owner_id,  presence: true
  validates :score,  presence: true
  validates :feedback,  presence: true,
                        length: { in: 3..256 }
  validates :title,  presence: true,length: { in: 3..128 }

  #enum score: {
  #  neutral: 0,
  #  negative: -1,
  #  positive: 1
  #}
end
