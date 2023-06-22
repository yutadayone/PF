class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :genre_name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
end
