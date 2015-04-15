class Park < ActiveRecord::Base
  has_many :courts, dependent: :destroy
  has_many :games, through: :courts
  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

end
