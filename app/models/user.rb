class User < ActiveRecord::Base
	acts_as_authentic

	belongs_to :lease, :foreign_key => 'lease_id'
	has_many :submittedreports, :class_name => 'RepairRequest'
	has_many :approvedreports, :class_name => 'RepairRequest'

end
