class Address < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :orders

  validates_presence_of :location, :user
  validates_presence_of :name, :line1, :line2, :mobile
end