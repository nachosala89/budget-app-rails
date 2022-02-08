class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transacs
  has_many :transacs, through: :category_transacs

  def amount
    result = 0
    transacs.each { |transac| result += transac.amount }
    result
  end

  def created_at
    super.strftime('%-d %b. %Y at %l:%M%P')
  end
end
