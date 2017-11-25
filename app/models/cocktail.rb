class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :photo, presence: true
end
