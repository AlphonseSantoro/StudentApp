class MainController < UsersController
  before_action :is_signedin, except: [:login, :signin]
  
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
    
  end
  
  def signin
    reset_session
    if User.sign_in(params)
      session[:signedin] = true
      session[:id] = User.user_id(params[:signin][:email]).first.id
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

  def is_signedin
    unless session[:signedin]
      redirect_to '/login'
    end
  end
end
