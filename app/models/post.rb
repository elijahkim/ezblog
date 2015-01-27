class Post < ActiveRecord::Base
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :content, presence: true

  delegate :email, to: :user
end
