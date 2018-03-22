module CommentsHelper

    def newComment
        Comment.new
    end

    def showComments(params)
        @comments = Comment.where(upload_id: params[:format]).order(created_at: :desc)
        @firstComment = Comment.where(upload_id: params[:format]).first
        if @firstComment != nil
          @username = User.find(@firstComment[:user_id])
        else
          @comments = "Ingen kommentarer"
        end
    end
end
