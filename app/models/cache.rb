class Cache < ActiveRecord::Base
  extend AllabolagConnector
  def self.fetch(query)
    @cache = Cache.where("name LIKE ?", "#{query}%").take
    if @cache
      @result = @cache
    else
      @result = search(query)
      if @result[:orgnr]
        @cache = Cache.new(@result)
        @cache.save
      end
      @result
    end
  end
end
