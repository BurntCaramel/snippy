class Snippet < ApplicationRecord
  include AlgoliaSearch

  validates :title, presence: true
  validates :code, presence: true

  belongs_to :category

  algoliasearch do
    attribute :title, :category_title, :description
    searchableAttributes ['title', 'category_title', 'unordered(description)']
  end

  def category_title
    category.try(:title)
  end
end
