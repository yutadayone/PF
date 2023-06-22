class Review < ApplicationRecord
  belongs_to :costomer
  belongs_to :item
  has_many :comments, dependent: :destroy

  validates :introduction, presence:true, length: { minimum: 1, maximum: 300 }
  validates :star, presence:true, length: { minimum: 1, maximum: 20 }
end
