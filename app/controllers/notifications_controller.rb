class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@notifications = Notification.where(recipient: current_user, read_at: nil).take(10)
  	# respond_to do |format|
  	# 	format.json { render json: @notifications }
  	# 	format.html { render index: @notifications }
  	# end
    
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user, read_at: nil).unread.take(10)
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
