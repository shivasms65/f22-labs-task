# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :manage, :all
    else
      can :create, Answer
      can :read, Question
    end
    # can :read, :user                 # allow everyone to read everything
    # return unless user && user.admin?
    
    # can :read, :dashboard           # allow access to dashboard
    # if user.role? :superadmin
    #   can :manage, :all             # allow superadmins to do anything
    # elsif user.role? :manager
    #   can :manage, [User, Product]  # allow managers to do anything to products and users
    # elsif user.role? :sales
    #   can :update, Product, hidden: false  # allow sales to only update visible products
    # end
  end
end
