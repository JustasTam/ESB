class PagesController < ApplicationController
  def index
    session[:error] = nil
  end
end
