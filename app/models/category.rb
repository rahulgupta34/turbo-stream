class Category < ApplicationRecord

    scope :checkbox_delete, -> (params) { where_contion(params) } 

    def self.where_contion(params)
        where(id: params)
    end

end
