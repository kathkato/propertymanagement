class Property < ActiveRecord::Base
	has_many :units

	validates :name, :address, :city, :state, :zip, presence: true
end
