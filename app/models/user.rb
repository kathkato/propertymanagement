class User < ActiveRecord::Base
	acts_as_authentic

	belongs_to :lease, :foreign_key => 'lease_id'
	has_many :submittedreports, :class_name => 'RepairRequest'
	has_many :approvedreports, :class_name => 'RepairRequest'

	has_and_belongs_to_many :roles

	def has_role?(role_sym)
		roles.any? { |r| r.name.underscore.to_sym == role_sym } #returns true or false
	end

end
