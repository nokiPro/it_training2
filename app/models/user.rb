class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :name, presence: true #追記
  has_one_attached :icon
  has_many :blogs, dependent: :destroy
  has_many :comments
end
