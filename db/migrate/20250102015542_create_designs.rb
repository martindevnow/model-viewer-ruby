class CreateDesigns < ActiveRecord::Migration[8.0]
  def change
    # Designs belong to an author
    create_table :designs do |t|
      t.string :name
      t.string :folder

      t.belongs_to :author
      # t.references :parent, index: true, foreign_key: { to_table: :designs }

      t.belongs_to :parent,
        class_name: "Design",
        inverse_of: :components
      t.has_many :components,
        class_name: "Design",
        foreign_key: "parent_id",
        inverse_of: :parent

      t.scope :top_level, -> { where(parent_id: nil) }

      t.timestamps
    end
  end
end
