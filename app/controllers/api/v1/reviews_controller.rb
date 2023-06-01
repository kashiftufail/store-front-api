class Api::V1::ReviewsController < ApplicationController
  
  before_action :set_review, only: [:show]   
  before_action :check_owner, only: [:show]    
 
  def create         
    @review = Review.new(review_params)  
    @review.user = current_user 
    if @review.save
      render json: searlizer_json(@review) , status: :created, location: api_v1_review_path(@review)
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end  
  
  def show
    render json: searlizer_json(@review)    
  end  
  
  private    

  def check_owner
    return render json: {message: "it's not your data."} unless current_user.reviews.include? @review
  end  

  def searlizer_json(review)
    ReviewSerializer.new(review).serializable_hash.to_json
  end  

  def set_review    
    @review = Review.find(params[:id])
  end  

  def review_params
    params.require(:review).permit(:title, :body, :ratings, :user_id, :book_id, :is_available)    
  end
end
