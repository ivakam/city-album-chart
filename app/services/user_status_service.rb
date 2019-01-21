class UserStatusService
    def initialize(params)
        @user = params[:user]
        @upvote = params[:upvote]
    end
    
    def update
        return
        if @upvote
            @user = @upvote.post.user
        end
        u = Upvote.where(user: @user).size
        po = Post.where(user: @user).size
        a = Album.where(user_id: @user.id).size
        type = 'Member'
        if u >= 10 || po >= 10
            type = 'Plastic lover'
            if u >= 50 && po >= 10
                type = 'City popper'
                if u >= 100 && po >= 50 && a >= 5
                    type = 'Dorothy\'s Sister'
                    if u >= 250 && po >= 100 && a >= 20
                        type = 'Flapper'
                        if u >= 500 && po >= 250 && a >= 25
                            type = 'Awooo'
                            if u >= 1000 && po >= 500 && a >= 40
                                type = 'Big Daddy Chopper'
                            end
                        end
                    end
                end
            end
        end
        if type != @user.account_type
            @user.update_attribute('account_type', type)
        end
    end
end