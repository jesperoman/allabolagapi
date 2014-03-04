module AllabolagConnector
  def search(query)
    response = fetchresponse(query)
    extractdata(response, query)
  end
  def extractdata(response, name)
    match = response.match(/(\d+)\/#{name.gsub(/ /, "_")}.+title="(.*?)"/i)
    if match
      orgnr = match[1]
      name = HTMLEntities.new.decode(match[2])
      @result = { orgnr: orgnr, name: name }
    else
      @result = { error: "Nothing found" }
    end
  end
  def fetchresponse(query)
    url = Allabolagapi::Application.config.search_url + URI.encode(query)
    response = Net::HTTP.get(URI.parse(url))
  end
end

