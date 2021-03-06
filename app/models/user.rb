class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :name,uniqueness: true,length: { in: 2..20 }
  validates :introduction,length: { maximum: 50 }

  # ActiveStorageとの関連付け
  has_one_attached :profile_image
  # Bookモデルとのアソシエーション
  has_many :books,dependent: :destroy

  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: size).processed
  end
end
