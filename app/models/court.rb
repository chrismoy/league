class Court < ActiveRecord::Base
  belongs_to :park
  has_many :games
  validates :park_id, presence: true
  validates :img, presence: true
end
