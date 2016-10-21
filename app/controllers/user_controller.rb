class UserController < ApplicationController
   
  def create #User.create(first_name:'mike', last_name:'mike', password:'password', location:'bellevue', state:'wa', email:'mike@gmail.com') - all this info going into params
    new_user = User.create(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to "/events"
    else
      flash[:errors] = new_user.errors.full_messages
      redirect_to "/"
    end
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User Information Successfully Updated"
      redirect_to '/events'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end

