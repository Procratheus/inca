class ContentsDatatable

  def initialize(view)
    @view = view
  end

  def as_json(options={})
    {
      data: data,
      recordsTotal: my_search.count,
      recordsFiltered:sort_order_filter.count
    }
  end

  private

    def data
      contents.map do |product|
        [
          product.publisher_name,
          product.title,
          product.author,
          product.e_isbn,
          product.availabilty,
          product.price_gbp,
          product.price_eur,
          product.price_usd
        ]
      end
    end

    def contents
      @contents ||= fetch_contents
    end

    def fetch_contents
      contents = Content.order("#{sort_column} #{sort_direction}")
      contents.page(page).per_page(per_page)
      if params[:search][:value].present?
        contents = contents.where("publisher_name like :search or title like :search or author like :search or e_isbn like :search or availabilty like :search or price_gbp like :search or price_eur like :search or price_gbp like :search", search: "%#{params[:search][:value]}%" )
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
      columns = %w[publisher_name title author e_isbn availabilty price_gbp price_eur price_usd]
      columns[params[:order][:i][:column].to_i]
    end

    def sort_direction
      params[:order][:i][:dir] == "asc" ? "asc" : "desc"
    end
end
