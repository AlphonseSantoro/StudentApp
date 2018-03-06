class MainController < UsersController
  
  def hovedside
  end

  def profil
    unless session[:signedin]
      redirect_to '/main/login'
    end
  end

  def login
  end

  def signin
    @email = params[:signin][:email]
    @password = params[:signin][:password]
    @user = User.where(email: @email).first
    if @user != nil
      @salt = @user[:salt]
      @password_hash = @user[:password] 
      @password = User.hash_password(@password, @salt)
      validate = User.validate_password(@password_hash, @password)
      if validate
        session[:signedin] = true
        redirect_to '/main/profil'
      else
        redirect_to '/main/login', notice: 'Feil passord'
      end
    else
      redirect_to '/main/login', notice: "Fant ingen bruker med email: #{ @email }"
    end    
  end

  def logout
    session[:signedin] = false
    redirect_to '/main/login'
  end
end
