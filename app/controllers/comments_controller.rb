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
    def test
        Comment.create(content: "将来都会住んだときに「鳥取どこ？」とか言われそうで不安、、、", user_id: 1, item_id: 12)
        redirect_to '/'
    end
end
