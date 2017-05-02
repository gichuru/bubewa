class PagesController < ApplicationController
  def about
  end

  def how
  end

  def faqs
  end

  def contact
  end

  def privacy
  end

  def tos
  end

  def guidelines
  end

  def search
      redirect_to root_url unless params[:query]

      @query = params[:query]
      @listings = Listing.text_search(@query)
  end
end
