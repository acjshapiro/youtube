class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :edit, :delete]

  def index
    @movies =  Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end


  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to moives_path
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect to movies_path
  end

  private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.require(:movie).permit(:title, :duration, :genre, :description, :trailer)
      end   
end
