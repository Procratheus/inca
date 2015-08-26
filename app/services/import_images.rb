class ImportImages
  require "open-uri"

  def self.call(content)
    api = ENV['API_IMAGE_URL']
    image_width = 300
    content.update(content_image: "#{api}id=#{content.kortext_id}&width=#{image_width}")
    begin
      image_file = "#{Rails.root.to_s}/public/img/content-images/#{content.kortext_id}.jpg"
      no_image_file = "#{Rails.root.to_s}/public/img/no-image-available.jpg"
      source_url = content.content_image
      file = open(source_url)
    rescue OpenURI::HTTPError => e
      file = open(no_image_file)
    end
    File.open(image_file, "wb") do |f|
      f.write file.read
    end
  end


end
