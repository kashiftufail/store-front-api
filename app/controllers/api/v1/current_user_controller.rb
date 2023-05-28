class Api::V1::CurrentUserController < ApplicationController  
  def index
    render json: UserSerializer.new(User.all).serializable_hash.to_json
  end  
end
