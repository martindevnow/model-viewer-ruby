class CreateTags < ActiveRecord::Migration[8.0]
  def change
    # Tags exist independently of authors
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
