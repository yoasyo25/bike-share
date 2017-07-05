class Subscription < ActiveRecord::Base
  has_many :trips

  validates :subscription_type, presence: true
end
