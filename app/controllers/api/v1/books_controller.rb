class Api::V1::BooksController < ApplicationController  
  before_action :set_book, only: [:update, :show, :destroy]
  before_action :check_admin, only: [:create, :update, :destroy]
  
  def index
    all_books
  end

  def create    
    @book = Book.new(book_params)  
    
    if @book.save
      render json: searlizer_json(@book) , status: :created, location: api_v1_book_path(@book)
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: searlizer_json(@book)    
  end

  def update
    if @book.update(book_params)
      render json: searlizer_json(@book), location: api_v1_book_path(@book)
    else
      render json: @book.errors, status: :unprocessable_entity
    end  
  end 
  
  def destroy
    
    if @book.destroy
      all_books
    else
      render json: @book.errors
    end   
  end  
  
  private

  def check_admin
    return render json: {message: 'not allowed.'} unless current_user.admin_role_type?
  end

  def all_books
    books = Book.includes(:author , :supplier)
    render json: BookSerializer.new(books).serializable_hash.to_json
  end  

  def searlizer_json(book)
    options = { include: %i[supplier author] }
    BookSerializer.new([book], options).serializable_hash.to_json    
  end  

  def set_book
    @book = Book.find(params[:id])
  end  

  def book_params
    params.require(:book).permit(:title, :isbn, :year_published, 
                                 :price, :out_of_print, :author_id, :supplier_id )    
  end
end
