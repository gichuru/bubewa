json.array! @notification do |notification|
  json.id notification.id
  #json.recipient notification.recipient
  json.actor notification.actor.f_name
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a {notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url listing_review_path(notification.notifiable.listing_review, anchor: dom_id(notification.notifiable))
end