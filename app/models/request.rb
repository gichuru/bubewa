class Request < ApplicationRecord
	belongs_to :user
	validates :name, :website, :reason, presence: true
end
