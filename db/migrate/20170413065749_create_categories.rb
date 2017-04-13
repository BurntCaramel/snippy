class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, default: 'Unknown'

      t.timestamps
    end
  end
end
