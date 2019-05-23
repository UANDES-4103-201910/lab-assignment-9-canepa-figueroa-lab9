# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :create, UserTicket
      can :read, [:UserTicket], user_id: user.id
      can :read, [:Place, :Event, :Ticket]
      if user.admin?
        can :manage, [User, Place, Event, Ticket]
      end
    end
  end
end
