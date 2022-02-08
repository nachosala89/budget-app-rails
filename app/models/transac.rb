class Transac < ApplicationRecord
  belongs_to :user
  has_many :category_transacs
  has_many :categories, through: :category_transacs

  def created_at
    super.strftime('%-d %b. %Y at %l:%M%P')
  end
end
