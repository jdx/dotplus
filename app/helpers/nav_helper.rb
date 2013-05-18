module NavHelper
  def nav_city_link(city: '', subdomain: '')
    css_class = request.subdomain == subdomain ? "active" : ""
    content_tag :li, class: css_class do
      link_to city, root_url(subdomain: subdomain)
    end
  end
end
