class SubscriptionsController < ApplicationController
    def create
        if get_user
            @subscription = Subscription.find_by(user: get_user, target_id: params[:subscription][:target_id], subscription_type: params[:subscription][:subscription_type])
            if @subscription.present?
                return destroy
            end
            @subscription = Subscription.new(subscription_params)
            @subscription.user = get_user
            @subscription.save
        else
            on_access_denied
        end
    end
  
    def destroy
        @subscription.destroy
    end

    private
  
    def subscription_params
        params.require(:subscription).permit(:target_id, :subscription_type)
    end
end
