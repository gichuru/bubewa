class Notification < ApplicationRecord
	belongs_to :recipient, class_name: "user"
	belongs_to :actor, class_name: "user"
	belongs_to :notifiable, polymorphic: true
end
