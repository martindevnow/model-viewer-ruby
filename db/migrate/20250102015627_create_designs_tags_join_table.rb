class CreateDesignsTagsJoinTable < ActiveRecord::Migration[8.0]
  def change
    # Tags have many-to-many relationship with designs

    create_join_table :designs, :tags do |t|
      t.index :design_id
      t.index :tag_id

      t.timestamps
    end
  end
end
