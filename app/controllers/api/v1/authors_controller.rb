class Api::V1::AuthorsController < ApplicationController
  include CheckAdmin
  before_action :set_author, only: [:update, :show, :destroy]
  
  def index
    all_authors
  end

  def create    
    @author = Author.new(author_params)  
  
    if @author.save
      render json: searlizer_json(@author) , status: :created, location: api_v1_author_path(@author)
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end  
  
  def show
    render json: searlizer_json(@author)    
  end

  def update
    if @author.update(author_params)
      render json: searlizer_json(@author), location: api_v1_author_path(@author)
    else
      render json: @author.errors, status: :unprocessable_entity
    end  
  end 
  
  def destroy
    
    if @author.destroy
      all_authors
    else
      render json: @author.errors
    end   
  end  
  
  private

  def all_authors
    authors = Author.includes(:books)
    render json: AuthorSerializer.new(authors).serializable_hash.to_json
  end  

  def searlizer_json(author)
    AuthorSerializer.new(author).serializable_hash.to_json
  end  

  def set_author
    @author = Author.find(params[:id])
  end  

  def author_params
    params.require(:author).permit(:image, :title, :full_name)    
  end
end
