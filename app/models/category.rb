class Category < ApplicationRecord

    scope :checkbox_delete, -> (params) { where(id: params) } 

end
