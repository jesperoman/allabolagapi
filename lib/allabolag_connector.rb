module AllabolagConnector
  def search(query)
    if query.match(/^[a-zA-Z0-9 ]+$/)
      response = fetch_response(query)
      extract_data(response, query)
    else
      @result = {error: "Only alphanumeric characters and space allowed, a-zA-Z0-9."}
    end
  end

  def extract_data(response, name)
    match = response.match(/(\d+)\/#{name.gsub(/ /, "_")}.+title="(.*?)"/i)
    if match
      org_nr = match[1]
      name = HTMLEntities.new.decode(match[2])
      @result = { orgnr: org_nr, name: name }
    else
      @result = { error: "Nothing found" }
    end
  end

  def fetch_response(query)
    url = Allabolagapi::Application.config.search_url + URI.encode(query)
    response = Net::HTTP.get(URI.parse(url))
  end
end

