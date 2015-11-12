class Post < ActiveRecord::Base
	validates :name, presence: true
	validates :news, presence: true

	belongs_to :user
end
