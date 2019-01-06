class PostsController < ApplicationController
    def create
        if get_user
            @thread = ForumThread.find_by(id: params[:post][:thread_id])
            @post = Post.new()
            @post.body = params[:post][:body]
            @post.user = get_user
            @post.forum_thread = @thread
            @post.post_index = @thread.posts.size + 1
            @post.save
            redirect_to forum_path + "/#{@thread.category}/t/#{@thread.id}?p=#{(@thread.posts.size / 10.0).ceil}"
        else
            login_barrier
    end
    
    def update
        @post = Post.find_by(params[:post][:id])
        if get_user == @post.user || get_user.admin
            @post = Post.find_by(params[:post][:id])
            @post.body = params[:post][:body]
            @post.save
            redirect_to request.referrer
        else
            on_access_denied
    end
    
    def destroy
        @post = Post.find_by(params[:post][:id])
        if @post.user == get_user || get_user.admin
            @post = Post.find_by(params[:post][:id])
            @post.destroy
            redirect_to request.referrer
        else
            on_access_denied
    end
    
    private
    
    def post_params
        params.require(:post).permit(:thread_id, :body, :id)
    end
end