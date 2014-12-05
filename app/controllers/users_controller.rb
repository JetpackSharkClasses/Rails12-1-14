class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
  		redirect_to @user
	else
		render 'new'
	end
  end

  def show
  	uid = params[:id]
  	@user = User.find(uid)
    @microposts = @user.microposts
    @micropost = @user.microposts.build
  end

  def destroy
  	uid = params[:id]
  	if current_user.is_admin? || 
  		current_user.id = uid
	  	@user = User.find(uid)
	  	@user.destroy
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name,
  			:email, :password,
  			:password_confirmation)
	end
end
