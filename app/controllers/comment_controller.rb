class CommentController < ApplicationController
    before_filter :require_login

  def create


      body = params[:body]
      commentable_id = params[:commentable_id]
      commentable_class_type = params[:commentable_class_type] # a string like 'project'

      commentable_class = commentable_class_type.classify.safe_constantize

      commentable_record =  commentable_class.find_by_id(commentable_id)

      @user_who_commented =  current_user
      @comment = Comment.build_from( commentable_record, @user_who_commented.id, body  )
      @comment.save

      render json: @comment

  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def destroy
    @comment = Comment.find_by_id(params[:comment_id])


    if current_user and current_user.is_admin

      @comment.destroy

    end

      render text:  "Deleted Comment"
  end

end
