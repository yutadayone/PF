class Tag < ApplicationRecord
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :tag_items, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してreviewsテーブルへの関連付け
  has_many :reviews, through: :tag_items, dependent: :destroy

  validates :tags, presence:true, uniqueness: true, length: { minimum: 1, maximum: 300 }
end
