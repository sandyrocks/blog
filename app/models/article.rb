class Article < ActiveRecord::Base
  #Association
  has_many :comments
  belongs_to :category, required: true
  belongs_to :user, required: true

  #validation
  validates :title, presence: true
  validates :description, presence: true
end
