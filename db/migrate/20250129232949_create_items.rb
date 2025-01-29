class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :directory
      t.string :item_name
      t.string :test
      t.string :relative_path, index: { unique: true, name: "unique_relative_path" }
      t.references :design, null: true, foreign_key: true
      # t.belongs_to :design # I am unsure the difference

      t.timestamps
    end
  end
end
