class ReviewsController < ApplicationController

  ####grabbing the correct movie by using params[:movie_id] 
  # at the beginning of each of these actions
  # Then we can automatically assign the movie_id to our 
  # new @review by building it like this


  before_filter :load_movie

  def new
    # @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build
    ## SAME AS  @review = Review.new(movie_id: @movie.id)
  end

  def create
    # @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @movie, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end


end
