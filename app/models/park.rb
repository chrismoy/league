class Park < ActiveRecord::Base
  has_many :courts, dependent: :destroy
  has_many :games, through: :courts
  validates :name, presence: true
  validates :address, presence: true
  # validates :opening_time, presence: true
  # validates :closing_time, presence: true
  # validates :game_length, presence: true

  geocoded_by :address
  after_validation :geocode

end
