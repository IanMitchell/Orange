class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :reviewee, class_name: 'User'


  validates :user_id,  presence: true
  validates :reviewee_id,  presence: true
  validates :post_id,  presence: true
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
