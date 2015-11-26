class Game < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true,
					 length: { minimum: 2 }

	validates :user_id, presence: true
end
