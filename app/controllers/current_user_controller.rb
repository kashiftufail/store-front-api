class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    puts params.inspect+"AAAAAAAAAAAAAAAAAAAAAAAA"
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  def all_users
    render json: UserSerializer.new(User.last).serializable_hash[:data][:attributes], status: :ok  
  end
end
