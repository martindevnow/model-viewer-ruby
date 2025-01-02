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
  name: "Design 1",
  author_id: 1,
  folder: "folder1",
  file_name: "file1.stl",
  full_path: "folder1/file1.stl"
}, {
  name: "Design 2",
  author_id: 2,
  folder: "folder2",
  file_name: "file2.stl",
  full_path: "folder2/file2.stl"
} ])
p "Created #{Design.count} designs"

Tag.destroy_all

Tag.create([ {  name: "tag1" }, {  name: "tag2" }, {  name: "tag3" } ])
p "Created #{Tag.count} tags"

DesignsTags.destroy_all
DesignsTags.create([ { design_id: 1, tag_id: 1 }, { design_id: 1, tag_id: 2 }, { design_id: 2, tag_id: 3 } ])
p "Added #{DesignsTags.count} tags to the designs"
