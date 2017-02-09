class ReviewsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_listing
  before_action :set_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :check_user, only: [:edit, :update, :destroy]


  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  def user
    @user = User.all
    
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.listing_id = @listing.id

    respond_to do |format|
        if @review.save

          #create notifications to users
           # @listing.users.each do |user|
            #  Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @review)
             # end

          format.html { redirect_to @listing, notice: 'Your review was successfully posted.' }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|

      if @review.update(review_params)
        format.html { redirect_to root_url, notice: 'Your Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to listing_path(@listing), notice: 'Your Review was successfully destroyed :(.' }
      format.json { head :no_content }
    end
  end

  #Added the def upvote and downvote
  def upvote
    @review = Review.find(params[:review_id])
    @review.upvote_from current_user
    redirect_to :back
  end

  def downvote
    @review = Review.find(params[:review_id])
    @review.downvote_from current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find_by(params[:review_id])
    end

    #Check user

     def check_user
      unless (@review.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this review belongs to someone else, you can only edit reviews you have posted."
      end
    end


    #set listing

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
   
end
