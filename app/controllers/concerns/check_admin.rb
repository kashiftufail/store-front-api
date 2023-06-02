module CheckAdmin
  extend ActiveSupport::Concern
  
  included do
    before_action :check_admin, only: [:create, :update, :destroy]
    private
    def check_admin
      return render json: {message: 'not allowed.'} unless current_user.admin_role_type?
    end
  end
end