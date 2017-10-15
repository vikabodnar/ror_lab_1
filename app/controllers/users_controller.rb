class UsersController < ApplicationController
  def edit
  	  	@user =User.find(session[:id])
  end

  def update
    @user =User.find(session[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)

  if @user.save
  	redirect_to root_path
  else render 'new'
  end
  	
  end


  def login

  end

  
  def loginresult
  	@user =User.find_by_email_and_password(params[:user][:email],params[:user][:password])
  	if @user!=nil
  		session[:id]=@user.id
  		redirect_to user_path(@user.id) 	
  	end
  	
  end

  def show
  	@user =User.find(session[:id])

  end

  def destroy
  	session[:id] = nil
  	redirect_to root_path
  end

  private
def user_params
	params.require(:user).permit(:firstname, :lastname, :email, :password, :avatar, :phone, :country, :city, :age, :gender, :street)
end

end
