class Quote < ApplicationRecord
  validates :content, presence: true

  scope :recent_first, -> { order(created_at: :desc) }
end
