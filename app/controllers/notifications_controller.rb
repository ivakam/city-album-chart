class NotificationsController < ApplicationController
    def mark_as_read
        @notifications = Notification.where(user: get_user, unread: true)
        @notifications.each do | n |
            n.unread = false
            n.save
        end
    end
end