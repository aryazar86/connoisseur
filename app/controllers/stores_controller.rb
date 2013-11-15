class StoresController < ApplicationController
  def index
    the_url = ""
    if params['page'] == ""
      the_url = "http://lcboapi.com/stores"
    else
      the_url = "http://lcboapi.com/stores?page=" + "#{params['page']}"
    end

    stores_json = open(the_url).read

    @stores = JSON.parse(stores_json)
  end

  def show
    base_url = "http://lcboapi.com/stores/" + "#{params[:id]}"
    stores_json = open(base_url).read
    @store = JSON.parse(stores_json)
  end
end
