class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 10 }
end
