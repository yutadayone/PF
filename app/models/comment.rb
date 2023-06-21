class Comment < ApplicationRecord

  belongs_to :costomer
  belongs_to :review
  validates :introduction, presence:true, length: { minimum: 1, maximum: 300 }
end
