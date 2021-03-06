class Game < ActiveRecord::Base
  belongs_to :court
  has_and_belongs_to_many :users
  has_many :messages, dependent: :destroy
  default_scope -> { order(time: :asc) }
  validates :court_id, presence: true
  validates :time, presence: true

  def validate_time
  end
end
