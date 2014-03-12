class RepairRequest < ActiveRecord::Base

	belongs_to :submitter, :class_name => 'User', :foreign_key => 'submitter_id'
	belongs_to :responder, :class_name => 'User', :foreign_key => 'responder_id'

	def has_role?(role_sym)
		roles.any? { |r| r.name.underscore.to_sym == role_sym } #returns true or false
	end	
	
end
