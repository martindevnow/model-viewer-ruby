class Design < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :parent,
    class_name: "Design",
    inverse_of: :components,
    optional: true

  has_many :components,
    class_name: "Design",
    foreign_key: "parent_id",
    inverse_of: :parent

  has_many :items,
    class_name: "Item",
    foreign_key: "design_id"

  scope :top_level, -> { where(parent_id: nil) }
end
