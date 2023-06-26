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

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "あいう"
      customer.first_name = "えお"
      customer.last_name_kana = "アイウ"
      customer.first_name_kana = "エオ"
      customer.post_code = "00"
      customer.address = "99"
      customer.tel = "88"
      # customer.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば lastname を入力必須としているならば， customer.lastname = "ゲスト" なども必要
    end
  end
end
