class Project < ActiveRecord::Base
	validates :name, :email, :issue, :sector, :image, :phone, presence: true
	belongs_to :user
end
