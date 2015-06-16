class Organization < ActiveRecord::Base
  has_many :parks, dependent: :destroy

  validates :name, presence: true

  def to_param
    "#{id}-#{name}"
  end
end
