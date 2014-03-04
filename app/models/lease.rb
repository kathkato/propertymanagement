class Lease < ActiveRecord::Base
	belongs_to :unit, :foreign_key => 'unit_id'
	has_many :renters, :class_name => 'User'

	validates :start_date, :end_date, presence: true
end
