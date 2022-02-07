class User < ApplicationRecord
  has_many :transacs, dependent: :destroy
  has_many :categorys, dependent: :destroy
end
