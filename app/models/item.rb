class Item < ApplicationRecord
  belongs_to :design, optional: true
end
