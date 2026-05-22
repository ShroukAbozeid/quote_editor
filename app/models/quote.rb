class Quote < ApplicationRecord
  validates :content, presence: true

  belongs_to :company

  scope :recent_first, -> { order(created_at: :desc) }

  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend

  after_create_commit :remove_empty_state
  after_destroy_commit :add_empty_state, if: -> { company.quotes.empty? }

  private

  def add_empty_state
    broadcast_append_to [ company, "quotes" ], target: "new_quote", partial: "quotes/empty_state"
  end

  def remove_empty_state
    broadcast_remove_to [ company, "quotes" ], target: "empty_state"
  end
end
