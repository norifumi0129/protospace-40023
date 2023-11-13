class CommentsController < ApplicationController
  def create
      @prototype = Prototype.find(params[:prototype_id])
      @comment = @prototype.comments.new(comment_params)
      @comment.user = current_user
    
      if @comment.save
        redirect_to prototype_path(@prototype)
      else
        # コメントの保存に失敗した場合、プロトタイプ詳細ページに留まる
        @comments = @prototype.comments # コメントの再取得
        render 'prototypes/show'
      end
  end
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end