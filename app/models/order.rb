class Order < ApplicationRecord
  belongs_to :product
end

class Product < ApplicationRecord
  has_many :orders
end