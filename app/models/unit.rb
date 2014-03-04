class Unit < ActiveRecord::Base
	belongs_to :property, :foreign_key => 'property_id'
	has_many :leases

	validates :name, presence: true
end
