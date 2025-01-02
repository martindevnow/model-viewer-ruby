namespace :authors do
  desc "TODO"
  task seed: :environment do
    Author.create([ {
      name: "Ben Martin"
    }, {
      name: "CA3D"
    }, {
      name: "ForgeCore"
    } ])
    p "Created #{Author.count} authors"
  end
end
