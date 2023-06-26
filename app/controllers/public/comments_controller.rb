class Public::CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    #formにてreview_idパラメータを送信して、コメントへreview_idを格納するようにする必要がある。
    params.require(:comment).permit(:introduction, :review_id)
  end
end
