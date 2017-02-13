json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor
  json.action notification.action
  json.notifiable notification.notifiable
  json.url listing_path(notification.notifiable.listing)
  

  end