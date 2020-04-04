class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many  :products           , dependent: :destroy
  has_many  :cards              , dependent: :destroy
  has_many  :likes              , dependent: :destroy
  has_many  :evaluations        , dependent: :destroy
  has_one   :address            , dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname , :lastname, :firstname_kana, :lastname_kana, :nickname, :birth_year, :birth_month, :birth_day, :tel_number, presence: true
  validates :tel_number, uniqueness: true

  validates :firstname     , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lastname      , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :firstname_kana, format: {with: /\A[ぁ-んー－]+\z/}
  validates :lastname_kana , format: {with: /\A[ぁ-んー－]+\z/}
  validates :birth_year    , format: {with: /\A[0-9]+\z/}
  validates :birth_month   , format: {with: /\A[0-9]+\z/}
  validates :birth_day     , format: {with: /\A[0-9]+\z/}
  validates :tel_number    , format: {with: /\A[0-9]+\z/}

end
