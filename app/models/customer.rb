class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :last_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :first_name, presence:true, length: { minimum: 1, maximum: 20 }
  validates :last_name_kana, presence:true, length: { minimum: 1, maximum: 20 }
  validates :first_name_kana, presence:true, length: { minimum: 1, maximum: 20 }
  validates :post_code, presence:true, length: { minimum: 2, maximum: 20 }
  validates :address, presence:true, length: { minimum: 2, maximum: 40 }
  validates :tel, presence:true, length: { minimum: 2, maximum: 20 }
  validates :email, presence:true, length: { minimum: 2, maximum: 30 }

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
