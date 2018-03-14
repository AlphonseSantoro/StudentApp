class MainController < UsersController
  
  def hovedside
    @notat = Upload.order(id: :desc)
  end

  def profil
    unless session[:signedin]
      redirect_to '/login'
    end
  end

  def login
  end

  def notat
    @upload = Upload.where(user_id: session[:id])
  end

  def document
    @comment = Comment.new
    @document = Upload.find(params[:format])
    @comments = Comment.where(upload_id: params[:format])
    @firstComment = Comment.where(upload_id: params[:format]).first
    if @firstComment != nil
      @username = User.find(@firstComment[:user_id])
    else
      @comments= "Ingen kommentarer"
    end
  end

  def image
    @file = Binary.find(@document[:binary_id])
    @data = @file[:data]
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
        redirect_to '/hovedside'
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
