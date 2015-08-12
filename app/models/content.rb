class Content < ActiveRecord::Base
  belongs_to :publisher

  # Refile method
  attachment :content_image, type: :image

  def get_image
    api = ENV['API_IMAGE_URL']
    image_width = 200
    self.update(content_image: "#{api}id=#{self.kortext_id}&width=#{image_width}")
  end

end
