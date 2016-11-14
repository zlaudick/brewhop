class Micropost < ApplicationRecord
  belongs_to :brewery
  default_scope -> { order(created_at: :desc) }
  validates :brewery_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
