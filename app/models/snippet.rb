class Snippet < ApplicationRecord
  validates :title, presence: true
  validates :code, presence: true

  belongs_to :category
end
