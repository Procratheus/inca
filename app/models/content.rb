class Content < ActiveRecord::Base
  belongs_to :publisher

  def get_inventory  
    # Set the username and password and invoke the SOAP client and call the Kortext API
    create_savon_client
    response = client.call(:get_inventory, message: { "ser:username": "#{@username}", "ser:password": "#{@password}"})
    # Parse the the returned string into a hash
    xml_response = Nokogiri::XML(response.body[:get_inventory_response][:get_inventory_result])
  end

  def get_inventory_delta
    # Set the username and password and invoke the SOAP client and call the Kortext API
    create_savon_client
    response = client.call(:get_inventory_delta, message: { "ser:username": "#{@username}", "ser:password": "#{@password}"}, "ser:lastUpdateTime": "#{@lastUpdateTime}")
    # Parse the the returned string into a hash
    xml_response = Nokogiri::XML(response.body[:get_inventory_delta_response][:get_inventory_delta_result])
  end

  def create_savon_client
      @lastUpdateTime = DateTime.now.iso8601(0) - 1
      @username = ENV["KORTEXT_USERNAME"]
      @password = ENV["KORTEXT_PASSWORD"]
      @client = Savon.client(wsdl: "#{ENV['API_URL']}", env_namespace: :soapenv, namespace_identifier: :ser, pretty_print_xml: true, follow_redirects: true)
  end

  def self.parse_hash(xml)
    xml.root.xpath("//product").each do |product| 
      where(kortext_id: product.xpath("a001").scan(/\d/).join.to_i).first_or_create do |content|
        content.kortext_id = product.xpath("a001").text.scan(/\d/).join.to_i
        content.e_isbn = product.xpath("b244").text 
        content.p_isbn = product.xpath("relatedproduct b244").text
        content.type = product.xpath("b012").text
        content.format = product.xpath("b333").text
        content.author = product.xpath("b036").text
        content.language = product.xpath("b252").text
        content.pages = product.xpath("b219").text.to_i
        content.description = product.xpath("d104").text 
        content.imprint = product.xpath("b079").text
        content.pub_date = product.xpath("b306").text
        content.price_gbp = product.xpath("j151").text
        content.price_usd = product.xpath("j151").text
        content.price_eur = product.xpath("j151").text
        content.bic = product.xpath("b069").text
        content.bisac = product.xpath("b069").text
        content.availability = product.xpath("j396").text.to_i
        content.edition = product.xpath("b057").text        
        content.publisher = product.xpath("b081").text
      end
    end 
  end

end
