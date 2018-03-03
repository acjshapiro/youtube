class CommentsController < ApplicationController
  before_action :set_movie
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @movie.comments
  end

  def show
  end

  def new
    @comment = @movie.comments.new

  end

  def edit
  end

  def create
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to [@movie, @comment]
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@movie, @comment]
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_comments_path
  end

  private

      def set_movie
        @movie = Movie.find(params[:movie_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:user_id, :movie_id, :body)
      end   

end
