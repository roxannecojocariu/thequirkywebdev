class Blog < ApplicationRecord
  has_rich_text :body
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
end
