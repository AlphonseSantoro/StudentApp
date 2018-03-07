class MainController < UsersController
  
  def hovedside
  end

  def profil
    unless session[:signedin]
      redirect_to '/login'
    end
  end

  def login
  end

  def notat
    @upload = Upload.where(users_id: session[:id])
  end

  def document
    @document = Upload.find(params[:format])
    image
  end

  def image
    @file = Binary.find(@document[:binary_id])
    @data = @file[:data]
    send_data @data, type: 'image/png', disposition: 'inline'
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
        session[:id] = @user[:id]
        redirect_to '/profil'
      else
        redirect_to '/login', notice: 'Feil passord'
      end
    else
      redirect_to '/login', notice: "Fant ingen bruker med email: #{ @email }"
    end    
  end

  def logout
    session[:signedin] = false
    redirect_to '/login'
  end

  def self.session_id
    session[:id]
  end
end
