class Property < ActiveRecord::Base
	has_many :units

	validates :name, :address, :email, :city, :state, :zip, presence: true
end
