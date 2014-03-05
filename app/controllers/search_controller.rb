require 'net/http'
require 'uri'

class SearchController < ApplicationController
  protect_from_forgery except: :index
  def index
    if params[:query]
      @result = Cache.fetch(params[:query])
      respond_to do |format|
        format.html
        format.json { render json: @result }
        format.xml {render xml: @result }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: {error: 'no query'}}
        format.xml { render xml: {error: 'no query'}}
      end
    end

  end
end
