class SiteController < ApplicationController
  def search

    term = params[:term]
    return if term.blank?

    @results = Product.search(params[:term])


    respond_to do |format|
      format.html
      format.js
    end
  end
end
