module UsersHelper

    def search_query(params)
        User.where("name LIKE '%#{params}%'")
    end
    
end
