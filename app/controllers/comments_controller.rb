class CommentsController < ApplicationController
    def show
        @comment = Comment.find_by(id: params[:id])
        @tweets = Tweet.all
        @comments = Comment.all
        @content_type = true
        if params[:tweet_screen] == "false"
            @content_type = false
        end
        end
end
