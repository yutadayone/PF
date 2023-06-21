class Item < ApplicationRecord

  belongs_to :genre
  belongs_to :customer
  has_many :reviews, dependent: :destroy

  validates :item_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :introduction, presence:true, length: { minimum: 1, maximum: 300 }

end
