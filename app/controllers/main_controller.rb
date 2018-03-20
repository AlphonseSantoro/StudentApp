class MainController < UsersController
  
  def hovedside
    unless session[:signedin]
      redirect_to '/login'
    end
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
      @comments = "Ingen kommentarer"
    end
  end
  
  def signin
    if User.sign_in(params)
      session[:signedin] = true
      session[:id] = User.user_id(params[:signin][:email])
      redirect_to '/hovedside'
      else
        redirect_to '/login', notice: 'Feil brukernavn eller passord'
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
