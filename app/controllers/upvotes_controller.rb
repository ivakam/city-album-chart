class UpvotesController < ApplicationController
    def destroy
        @upvote.destroy
    end
    
    def create
        if get_user
            if get_user.email_confirmed
                @upvote = Upvote.find_by(user: get_user, upvote_type: params[:upvote][:upvote_type], target_id: params[:upvote][:target_id])
                if @upvote.present?
                    return destroy
                end
                @upvote = Upvote.new(upvote_params)
                @upvote.user = get_user
                @upvote.save
            else
                activation_barrier
            end
        else
            login_barrier
        end
    end
    
    private
    
    def upvote_params
        params.require(:upvote).permit(:target_id, :upvote_type, :user_id)
    end
end
