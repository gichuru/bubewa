class PagesController < ApplicationController
  def home
    @trending = Listing.trending.paginate(:page => params[:page], :per_page => 4)
    @worst = Listing.worst.paginate(:page => params[:page], :per_page => 4)
    @latest = Listing.latest.paginate(:page => params[:page], :per_page => 4)
  end
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
      redirect_to root_url unless params[:query] || params[:query].blank?

      @query = params[:query]
      @listings = Listing.text_search(@query)
  end
end
