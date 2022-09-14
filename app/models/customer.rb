class Customer < ApplicationRecord
   has_many :shops, dependent: :destroy

   accepts_nested_attributes_for :shops, allow_destroy: true

end
