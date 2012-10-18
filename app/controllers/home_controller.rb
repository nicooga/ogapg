class HomeController < ApplicationController
  layout 'application', only: :views

  def index
  end

  def views
    render params[:view]
  end
end
