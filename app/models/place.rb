class Place < ApplicationRecord
  belongs_to :prefecture
  belongs_to :category
end
