class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  # def tax
  #   tax_rate = 0.09
  #   @product.price * tax_rate
  # end
end
