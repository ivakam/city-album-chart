class AutoSubscriptionService
    def initialize(params)
        @user = params[:model].user
        @target_id = params[:model].id
        @subscription_type = params[:model].class.name
    end
    
    def auto_subscribe
        @subscription = Subscription.new()
        @subscription.user = @user
        @subscription.target_id = @target_id
        @subscription.subscription_type = @subscription_type
        @subscription.save
    end
end