class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :on_record_not_found
    rescue_from AbstractController::ActionNotFound, with: :on_record_not_found
    rescue_from ActionController::RoutingError, with: :on_routing_error
    
    before_action do
        ActiveStorage::Current.host = request.base_url if Rails.application.config.active_storage.service == :local
    end
    
    rescue_from StandardError do
        render 'layouts/500'
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
    
    def login_barrier
        if params[:format].present? && params[:format] != 'html'
            head status: 401
        else
            render 'layouts/login_barrier'
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
