# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Author.destroy_all

Author.create([ {
  name: "Ben Martin"
}, {
  name: "CA3D"
}, {
  name: "ForgeCore"
} ])
p "Created #{Author.count} authors"


Design.destroy_all
Design.create([ {
  name: "Rukia",
  author_id: 1
}, {
  name: "Rukia - Bust",
  author_id: 1,
  parent_id: 1
}, {
  name: "Ichigo",
  author_id: 2
}, {
  name: "Ichigo - Bust",
  author_id: 2,
  parent_id: 3
} ])
p "Created #{Design.count} designs"

Item.destroy_all
Item.create([ {
  name: "Rukia - 1/12 Scale",
  description: "Rukia 1/12 Scale, Not Pre-supported",
  directory: false,
  item_name: "Rukia-1-12-Scale.stl",
  relative_path: "CA3D/CA3D-Rukia/1-12-scale.stl",
  design_id: 1
}, {
  name: "Rukia - 1/6 Scale",
  description: "Rukia 1/6 Scale, Not Pre-supported",
  directory: false,
  item_name: "Rukia-1-6-scale.stl",
  relative_path: "CA3D/CA3D-Rukia/1-6-scale.stl",
  design_id: 1
}, {
  name: "Rukia - Bust",
  description: "Rukia Bust, Not Pre-supported",
  directory: false,
  item_name: "Rukia-bust.stl",
  relative_path: "CA3D/CA3D-Rukia/bust.stl",
  design_id: 2
} ])

Tag.destroy_all
Tag.create([ {  name: "tag1" }, {  name: "tag2" }, {  name: "tag3" } ])
p "Created #{Tag.count} tags"

DesignsTags.destroy_all
DesignsTags.create([ { design_id: 1, tag_id: 1 }, { design_id: 1, tag_id: 2 }, { design_id: 2, tag_id: 3 } ])
p "Added #{DesignsTags.count} tags to the designs"
