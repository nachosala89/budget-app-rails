class User < ApplicationRecord
  has_many :transacs, dependent: :destroy
  has_many :categories, dependent: :destroy
end
