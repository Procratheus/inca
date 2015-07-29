class Content < ActiveRecord::Base
  belongs_to :publisher

  def get_inventory  
    # Set the username and password and invoke the SOAP client and call the Kortext API
    create_savon_client
    response = client.call(:get_inventory, message: { "ser:username": "#{@username}", "ser:password": "#{@password}"})
    # Parse the the returned string into a hash
    xml_response = REXML::Document.new(response.body[:get_inventory_response][:get_inventory_result])
    parse_hash
  end

  def get_inventory_delta
    # Set the username and password and invoke the SOAP client and call the Kortext API
    create_savon_client
    response = client.call(:get_inventory_delta, message: { "ser:username": "#{@username}", "ser:password": "#{@password}"}, "ser:lastUpdateTime": "#{DateTime.new().iso8601(9)}")
    # Parse the the returned string into a hash
    xml_response = REXML::Document.new(response.body[:get_inventory_delta_response][:get_inventory_delta_result])
    parse_hash
  end


  protected

  def create_savon_client
    if Rails.env.develoment? || Rails.env.test?
      @username = ENV["KORTEXT_TEST_USERNAME"]
      @password = ENV["KORTEXT_TEST_PASSWORD"]
    elsif Rails.env.production?
      @username = ENV["KORTEXT_PRODUCTION_USERNAME"]
      @password = ENV["KORTEXT_PRODUCTION_PASSWORD"]
    end
    client = Savon.client(wsdl: "https://testapp.kortext.com/api?wsdl", env_namespace: :soapenv, namespace_identifier: :ser, pretty_print_xml: true, follow_redirects: true)
  end

  def parse_hash
    out = ""
    xml_response.write(out, 1)
    inventory = Nokogiri::XML(out)
    inventory.root.xpath("//product").each { |product| puts product } 
  end

end
