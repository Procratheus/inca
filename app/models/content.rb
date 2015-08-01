class Content < ActiveRecord::Base
  belongs_to :publisher

  def self.get_inventory  
    # Set the username and password and invoke the SOAP client and call the Kortext API
    
    # Parse the the returned string into a hash
   
  end

  def self.get_inventory_delta
    # Set the username and password and invoke the SOAP client and call the Kortext API
    response = client.call(:get_inventory_delta, message: { "ser:username": "#{username}", "ser:password": "#{password}", "ser:lastUpdateTime": "#{@lastUpdateTime}" })
    # Parse the the returned string into a hash
    @xml_response = Nokogiri::XML(response.body[:get_inventory_delta_response][:get_inventory_delta_result])
  end

  def create_savon_client
    
  end

  def self.parse_hash
    #lastUpdateTime = DateTime.now.iso8601(0) - 1
    username = ENV["KORTEXT_USERNAME"]
    password = ENV["KORTEXT_PASSWORD"]
    api = ENV["API_URL"]
    client = Savon.client(wsdl: "#{api}", env_namespace: :soapenv, namespace_identifier: :ser, pretty_print_xml: true, follow_redirects: true)
    response = client.call(:get_inventory, message: { "ser:username": "#{username}", "ser:password": "#{password}"})
    xml_response = Nokogiri::XML(response.body[:get_inventory_response][:get_inventory_result])
    xml_response.root.xpath("//product").each do |product| 
      where(kortext_id: product.at_xpath("a001").text.scan(/\d/).join.to_i).first_or_create do |content|
        content.kortext_id = product.at_xpath("a001").text.scan(/\d/).join.to_i
        content[:e_isbn] = product.at_css("b244").text
        content.p_isbn = product.at_css("relatedproduct b244").text
        #content.type = product.at_css("b012").text
        content.format = product.at_css("b333").text
        content.author = product.at_css("b036").text
        content.language = product.at_css("b252").text
        content.pages = product.at_css("b219").text.scan(/\d/).join.to_i
        content.description = product.at_css("d104").text
        content.imprint = product.at_css("b079").text
        content.pub_date = product.at_css("b306").text
        content.price_gbp = product.at_css("j151").text
        content.price_usd = product.at_css("j151").text
        content.price_eur = product.at_css("j151").text
        #content.bic = product.at_css("b069").text == nil ? "Non Available" : product.at_css("b069").text
        #content.bisac = product.at_css("b069").text == nil ? "Non Available" : product.at_css("b069").text
        content.availability = product.at_css("j396").text.to_i
        content.edition = product.at_css("b057").text       
        #content.publisher = product.at_css("b081").text
      end
    end
  end

end
