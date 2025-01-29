class CreateDesigns < ActiveRecord::Migration[8.0]
  def change
    # Designs belong to an author
    create_table :designs do |t|
      t.string :name
      t.belongs_to :author
      t.references :parent, index: true, foreign_key: { to_table: :designs }

      t.timestamps
    end
  end
end
