module ApplicationHelper
    include Pagy::Frontend

    def pagy_url_for(pagy, page, absolute: false, html_escaped: false)  
        params = request.query_parameters.merge(pagy.vars[:page_param] => page, only_path: !absolute )
        html_escaped ? url_for(params).gsub('&', '&amp;') : url_for(params)
    end

end
