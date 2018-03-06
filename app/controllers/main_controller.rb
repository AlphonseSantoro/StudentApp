class MainController < UsersController
  
  def hovedside
  end

  def profil
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
        redirect_to '/main/profil'
      else
        redirect_to '/main/login', notice: 'Feil passord'
      end
    else
      redirect_to '/main/login', notice: "Fant ingen bruker med email: #{ @email }"
    end    
  end

  def logout
  end
end
