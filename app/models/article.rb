class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
end
