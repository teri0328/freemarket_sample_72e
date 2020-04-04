class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many  :products           , dependent: :destroy
  has_many  :cards              , dependent: :destroy
  has_many  :likes              , dependent: :destroy
  has_many  :evaluations        , dependent: :destroy
  # validates :encrypted_password , length: {minimum: 7}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :firstname, :lastname, :firstname_kana, :lastname_kana, :nickname, :birth_year, :birth_month, :birth_day, :tel_number, presence: true
end
