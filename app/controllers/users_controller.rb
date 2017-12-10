class UsersController < Devise::SessionsController
  before_action :store_user_location!, if: :storable_location?
 # The callback which stores the current location must be added before you authenticate the user
 # as `authenticate_user!` (or whatever your resource is) will halt the filter chain and redirect
 # before the location can be stored.
 before_action :authenticate_user!

  def index
    @currentUser = current_user.id
  end
  def create
    # Create the user from params
    @user = User.new(params[:user])
    if @user.save
      # Deliver the signup email
      UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
end
