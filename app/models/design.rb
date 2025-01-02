class Design < ApplicationRecord
  belongs_to :author
  belongs_to :parent,
    class_name: "Design",
    inverse_of: :components

  has_many :components,
    class_name: "Design",
    foreign_key: "parent_id",
    inverse_of: :parent

  scope :top_level, -> { where(parent_id: nil) }
end
