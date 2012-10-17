class HomeController < ApplicationController
  layout 'home'
  
  def index
    @products = Product.all
  end
end
