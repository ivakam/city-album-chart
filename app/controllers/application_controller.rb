class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :on_record_not_found
    rescue_from AbstractController::ActionNotFound, with: :on_record_not_found
    rescue_from ActionController::RoutingError, with: :on_routing_error

    def rescueHandler(view, unauthorized = false, e = 'Non-internal Error')
        p e
        if !unauthorized
            render "layouts/#{view}"
        else
            render "layouts/#{view}", :status => :unathorized
        end
    end
    
    def get_user
		if session[:user_id]
			user = User.find_by(id: session[:user_id])
			return user
		else
			return nil
		end
    end
    
    def render_404
        if params[:format].present? && params[:format] != 'html'
            head status: 404
        else
            render 'layouts/404', status: 404
        end
    end
    
    def on_access_denied
        if params[:format].present? && params[:format] != 'html'
            head status: 401
        else
            render 'layouts/401', status: 401
        end
    end

    def on_record_not_found
        render_404
    end
    
    def on_routing_error
        render_404
    end
end
