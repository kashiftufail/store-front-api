class Api::V1::UsersController < ApplicationController  
  
  def index    
    render json: UserSerializer.new(User.all).serializable_hash.to_json
  end 

  def show
    user = User.find(params[:id])
    options = { include: %i[orders reviews] }
    render json: UserSerializer.new([user], options).serializable_hash.to_json
  end

end
