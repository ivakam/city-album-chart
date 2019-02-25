class NotificationGeneratorService
    include UserInfo
    
    def initialize(params)
        @subscriptions = Subscription.where(subscription_type: params[:model].class.name, target_id: params[:model].id)
        @child = params[:child]
    end
    
    def generate_notifications
        @subscriptions.each do | s |
            if s.user.id != get_user
                @notification = Notification.new()
                @notification.target_id = @child.id
                @notification.notification_type = s.subscription_type
                @notification.user = s.user
                @notification.save
            end
        end
    end
end