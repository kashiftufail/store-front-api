module Image
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do    
    has_one_attached :image
  end  

  def get_image_url
    url_for(self.image)
  end

end