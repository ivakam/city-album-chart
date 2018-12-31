class ApplicationController < ActionController::Base
    def rescueHandler(view, e = 'Generic error')
        p e
        render "layouts/#{view}"
    end
end
