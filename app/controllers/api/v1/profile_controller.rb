class Api::V1::ProfileController < ApplicationController  
  
  before_action :set_profile, only: [:show, :update]   
  before_action :check_owner, only: [:show, :update]    
 
  def create     
    return render json: {message: 'already created.'} if current_user.profile   
    @profile = Profile.new(profile_params)  
    @profile.user = current_user 
    if @profile.save
      render json: searlizer_json(@profile) , status: :created, location: api_v1_profile_path(@profile)
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end  
  
  def show
    render json: searlizer_json(@profile)    
  end

  def update
    if  @profile.update(profile_params)
      render json: searlizer_json(@profile), location: api_v1_profile_path(@profile)
    else
      render json: @profile.errors, status: :unprocessable_entity
    end  
  end 
  
  
  private    

  def check_owner
    return render json: {message: "it's not your data."} if current_user.profile != @profile
  end  

  def searlizer_json(profile)
    ProfileSerializer.new(profile).serializable_hash.to_json
  end  

  def set_profile    
    @profile = Profile.find(params[:id])
  end  

  def profile_params
    params.require(:profile).permit(:city, :state, :zip, :address, :image)    
  end
end
