class Post < ActiveRecord::Base
  searchkick autocomplete: ['name']

  has_and_belongs_to_many :tags

  belongs_to :user
  belongs_to :buyer, class_name: 'User'
  belongs_to :created_by, class_name: 'User'
  has_many :reviews

  enum status: {
    open: 0,
    completed: 1,
    old: 2
  }

  validates :title,         presence: true

  validates :description,   presence: true


  attr_reader :tag_tokens, :give
  attr_accessible :title, :description, :user, :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  def give=(val)
    if val == true
      self.user = current_user
    else
      self.buyer = current_user
    end
  end
end
