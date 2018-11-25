class Item < ApplicationRecord
  has_many :tweets
  belongs_to :company
end
