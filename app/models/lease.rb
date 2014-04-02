class Lease < ActiveRecord::Base
	belongs_to :unit, :foreign_key => 'unit_id'
	has_many :renters, :class_name => 'User'
	has_many :payments

	validates :start_date, :end_date, presence: true
	validates :unit, presence: true

	validate :validate_start_end_date

	def validate_start_end_date
	errors.add(:start_date, 'must be before the end date') if
	self.start_date > self.end_date
	end

end
