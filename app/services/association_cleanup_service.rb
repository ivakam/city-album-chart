class AssociationCleanupService
    def initialize(params)
        @model = params[:model]
        @children = params[:children]
        if !@children.present?
            @children = {}
        end
    end
    
    def clean
        @junk = Upvote.find_by_sql("SELECT * FROM upvotes WHERE upvote_type='#{@model.class.name}' AND target_id='#{@model.id}'")
        @junk += Notification.find_by_sql("SELECT * FROM notifications WHERE notification_type='#{@model.class.name}' AND target_id='#{@model.id}'")
        @junk += Subscription.find_by_sql("SELECT * FROM subscriptions WHERE subscription_type='#{@model.class.name}' AND target_id='#{@model.id}'")
        @junk += Report.find_by_sql("SELECT * FROM reports WHERE report_type='#{@model.class.name}' AND target_id='#{@model.id}'")
        @children.each do | c |
            @junk += Upvote.find_by_sql("SELECT * FROM upvotes WHERE upvote_type='#{c.class.name}' AND target_id='#{c.id}'")
            @junk += Notification.find_by_sql("SELECT * FROM notifications WHERE notification_type='#{c.class.name}' AND target_id='#{c.id}'")
            @junk += Subscription.find_by_sql("SELECT * FROM subscriptions WHERE subscription_type='#{c.class.name}' AND target_id='#{c.id}'")
            @junk += Report.find_by_sql("SELECT * FROM reports WHERE report_type='#{c.class.name}' AND target_id='#{c.id}'")
        end
        @junk.each do | j |
            j.delete
        end
    end
end