class Transac < ApplicationRecord
  belongs_to :user
  has_many :categorys, through: :category_transacs
end
