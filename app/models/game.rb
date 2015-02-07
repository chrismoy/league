class Game < ActiveRecord::Base
  belongs_to :court
  has_and_belongs_to_many :users
  default_scope -> { order(time: :desc) }
  validates :court_id, presence: true
  validates :time, presence: true
end
