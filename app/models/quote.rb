class Quote < ApplicationRecord
  validates :content, presence: true

  belongs_to :company

  scope :recent_first, -> { order(created_at: :desc) }

  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend
end
