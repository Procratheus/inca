class ContentsDatatable

  include AvailableContent

  delegate :params, :link_to, :policy, :edit_content_path, :content_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options={})
    {
      data: data,
      recordsTotal: search.count,
      recordsFiltered: fetch_contents.count
    }
  end

  private

    def data
      contents.map do |content|
        [
          content.publisher_name,
          content.title,
          content.author,
          content.e_isbn,
          ContentAvailabilty.call(content.availability),
          content.price_gbp,
          content.price_eur,
          content.price_usd,
          policy(content).show? ? link_to("<i class='fa fa-book'></i>".html_safe, content_path(content)) : "n/a",
          policy(content).edit? ? link_to("<i class='glyphicon glyphicon-pencil'></i>".html_safe, edit_content_path(content)) : "n/a",
          policy(content).destroy? ? link_to("<i class='glyphicon glyphicon-remove'></i>".html_safe, content_path(content), method: :delete, data: { confirm: "Are you sure" }) : "n/a"
        ]
      end
    end

    def contents
      @contents ||= fetch_contents
    end

    def search
      @search= Content.order("#{sort_column} #{sort_direction}")
    end

    def fetch_contents
      contents = search.page(page).per_page(per_page)
      if params[:search][:value].present?
        contents = contents.where("publisher_name ILIKE :search or title ILIKE :search or author ILIKE :search or e_isbn ILIKE :search or availability ILIKE :search or price_gbp ILIKE :search or price_usd ILIKE :search or price_eur ILIKE :search", search: "%#{params[:search][:value]}%")
      end
      contents
    end

    def page
      params[:start].to_i/per_page + 1
    end

    def per_page
      params[:length].to_i > 0 ? params[:length].to_i : 10
    end

    def sort_column
      columns = %w[publisher_name title author e_isbn availability price_gbp price_eur price_usd]
      columns[params[:order][:"0"][:column].to_i]
    end

    def sort_direction
      params[:order][:"0"][:dir] == "asc" ? "asc" : "desc"
    end


end
