class OrderItem < ApplicationRecord
  belongs_to :dish_variant
  belongs_to :restaurant_order

  has_and_belongs_to_many :add_on_links

  after_commit do
    self.restaurant_order&.order && self.restaurant_order.order.reload.update_total
  end

  validates_presence_of :restaurant_order
  validates_presence_of :quantity

  def name
    self.dish_variant.dish.name
  end

  def price
    self.quantity * self.add_on_links.reduce(self.dish_variant.price) { |price, add_on_link| price+=add_on_link.price }
  end

end
