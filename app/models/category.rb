class Category < ApplicationRecord
  belongs_to :user
  has_many :transacs, through: :category_transacs
end
