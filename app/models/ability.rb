class Ability
  include CanCan::Ability

  def initialize(user)                  # allow everyone to read everything
    if user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all                  # allow access to dashboard
    elsif user.role? :supervisor
      can :edit, Articulo
      can :new, Articulo   
      can :read, Articulo     
    elsif user.role? :operador
      can :access, :rails_admin
      can :dashboard 
      can :edit, [Articulo, Empleado, Familia, Obra, Proveedor, Ubicacion]
      can :new, [Articulo, Empleado, Factura, Familia, Obra, Proveedor, Ubicacion]
      can :index, [Articulo, Empleado, Factura, Obra, Familia, Ubicacion, Proveedor]
      can :show, [Articulo, Empleado, Factura, Obra, Familia, Ubicacion, Proveedor]
    end
  end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
end