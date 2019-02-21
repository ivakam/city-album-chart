class AnnouncementsController < ApplicationController
    def create
        if get_user && get_user.admin
            @announcement = Announcement.new(announcement_params)
            @announcement.user = get_user
            @announcement.save
        else
            on_access_denied
        end
    end
    
    def destroy
        if params[:announcement][:serialized_ids].present? && get_user.admin
            announcement_ids = JSON.parse(params[:announcement][:serialized_ids])
            announcement_ids.each do | a |
                announcement = Announcement.find_by(id: a)
                announcement.destroy
            end
        else
    end
    
    private
    
    def announcement_params
        params.require(:announcement).permit(:title, :body)
    end
end