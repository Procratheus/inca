class ImportImages
  require "open-uri"

  def self.call(content)
    api = ENV['API_IMAGE_URL']
    image_width = 300
    content.update(content_image: "#{api}id=#{content.kortext_id}&width=#{image_width}")
  end


end
