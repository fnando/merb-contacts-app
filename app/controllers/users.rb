class Users < Application
  def new
    @user = User.new
    display @user
  end
  
  def create(user)
    @user = User.new(user)
    
    if @user.save
      message[:notice] = "Welcome to Contacts! Please login to access your account."
  	  redirect url(:session, :new), :message => message
    else
      render :new
    end
  end
end
