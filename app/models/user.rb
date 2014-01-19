class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {
    person: 0,
    organization: 1,
    admin: 2
  }

  has_many :posts
  has_many :reviews

  validates :name,  presence: true


  attr_accessible :name, :email, :password


  def can_post
    if self.completed_transactions.last
      if self.completed_transactions.last.reviews.count > 0
        if self.completed_transactions.last.reviews.where(buyer: self)
          true
        else
          false
        end
      else
        false
      end
    else
      true
    end
  end

  def completed_posts
    self.posts.completed
  end

  def completed_transactions
    Post.where(buyer: self).completed
  end
end
