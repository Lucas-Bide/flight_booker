class Booking < ApplicationRecord
  has_one :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: lambda { |att| att[:name].blank? || att[:email].blank?}
end
