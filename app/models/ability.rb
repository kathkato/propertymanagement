class Ability
  include CanCan::Ability

  def initialize(thisuser)
    thisuser ||= User.new #guest account

        if thisuser.has_role? :manager
            can :manage, :all
            cannot :create, RepairRequest
        elsif thisuser.has_role? :renter
            can :index, :all
            can :manage, thisuser
            can :create, RepairRequest, :submitter_id => thisuser.id
            can :manage, RepairRequest, :submitter_id => thisuser.id
        else
            can :create, User
            can :index, User
        end
  end
end
