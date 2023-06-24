class Review < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  #belongs_to :item
  has_many :comments, dependent: :destroy

  validates :introduction, presence:true, length: { minimum: 1, maximum: 300 }
  #validates :star, presence:true, length: { minimum: 1, maximum: 20 }
end
