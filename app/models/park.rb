class Park < ActiveRecord::Base
  has_many :courts, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
end
