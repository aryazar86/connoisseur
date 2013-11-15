require 'open-uri'

class ProductsController < ApplicationController

helper ProductsHelper

  def index
    the_url = ""
    if params['page'] == ""
      the_url = "http://lcboapi.com/products"
    else
      the_url = "http://lcboapi.com/products?page=" + "#{params['page']}"
    end

    products_json = open(the_url).read

    @products = JSON.parse(products_json)
  end

  def show
    base_url = ""
    base_url = "http://lcboapi.com/products/" + "#{params[:id]}"
    product_json = open(base_url).read
    @product = JSON.parse(product_json)
    
    if params['page'] != ""
      base_url = base_url  + "/stores?page=" + "#{params['page']}"
    else
      base_url = base_url + "/stores"
    end
    store_json = open(base_url).read
    @stores = JSON.parse(store_json)
  end
end
