class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 40}
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}

  def is_discounted?
    if price < 10
      "true"
    else
      "false"
    end
  end
end
