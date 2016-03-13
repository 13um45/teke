class SiteController < ApplicationController
  def search

    term = params[:term]
    return if term.blank?

    name = Product.search_name(params[:term])
    description = Product.search_description(params[:term])
    @results = (name + description).uniq


    respond_to do |format|
      format.html
      format.js
    end
  end
end
