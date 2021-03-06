class Message < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :content, presence: true
end
