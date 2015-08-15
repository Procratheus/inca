class ImportInventoryShared

  def self.set_variables
    @username = ENV["KORTEXT_USERNAME"]
    @password = ENV["KORTEXT_PASSWORD"]
    @api = ENV["API_URL"]
    @client = Savon.client(wsdl: "#{@api}", env_namespace: :soapenv, namespace_identifier: :ser, pretty_print_xml: true, follow_redirects: true)
  end

  def self.parse_xml(xml_response)
    xml_response.root.xpath("//product").each do |product|
      Content.where(kortext_id: product.at_css("a001") != nil ? product.at_css("a001").text.scan(/\d/).join.to_i : "Not Available" ).first_or_initialize do |content|
        content.kortext_id = product.at_css("a001") != nil ? product.at_css("a001").text.scan(/\d/).join.to_i : "Not Available"
        content.e_isbn = product.at_css("productidentifier b244") != nil ? product.at_css("productidentifier b244").text : "Not Available"
        content.p_isbn = product.at_css("relatedproduct b244") != nil ? product.at_css("relatedproduct b244").text : "Not Available"
        content.type_name = product.at_css("b012") != nil ? product.at_css("b012").text : "Not Available"
        content.format = product.at_css("b333") != nil ? product.at_css("b333").text : "Not Available"
        content.author = product.at_css("b036") != nil ? product.at_css("b036").text : "Not Available"
        content.language = product.at_css("b252") != nil ? product.at_css("b252").text : "Not Available"
        content.pages = product.at_css("b219").text.scan(/\d/).join.to_i != nil ? product.at_css("b219").text.scan(/\d/).join.to_i : "Not Available"
        content.description = product.at_css("d104") != nil ? product.at_css("d104").text : "Not Available"
        content.imprint = product.at_css("b079") != nil ? product.at_css("b079").text : "Not Available"
        content.pub_date = product.at_css("b306") != nil ? product.at_css("b306").text : "Not Available"
        content.title = product.at_css("b203") != nil ? product.at_css("b203").text : "Not Available"
        content.price_gbp = product.at_css("j151") != nil ? product.at_css("j151").text : "Not Available"
        content.price_usd = product.at_css("j151") != nil ? product.at_css("j151").text : "Not Available"
        content.price_eur = product.at_css("j151") != nil ? product.at_css("j151").text : "Not Available"
        content.vat = product.at_css("j262") != nil ? product.at_css("j262").text : "Not Available"
        content.bic = product.at_css("b069") != nil ? product.at_css("b069").text : "Not Available"
        content.bisac = product.at_css("b069") != nil ? product.at_css("b069").text : "Not Available"
        content.availability = product.at_css("j396").text != nil ? product.at_css("j396").text.to_i : "Not Available"
        content.edition = product.at_css("b057") != nil ? product.at_css("b057").text : "Not Available"
        content.publisher_name = product.at_css("b081") != nil ? product.at_css("b081").text : "Not Available"
        publisher = Publisher.where(name: content.publisher_name).first_or_create
        content.publisher_id = publisher.id
        content.save
      end
    end
  end
end
