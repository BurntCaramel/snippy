class AddCategoryToSnippet < ActiveRecord::Migration[5.0]
  def change
    add_reference :snippets, :category, foreign_key: true
  end
end
