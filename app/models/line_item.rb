class LineItem < ApplicationRecord
  validates :name, :unit_price, :quantity, presence: true
  validates :unit_price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :line_item_date

  delegate :quote, to: :line_item_date
end
