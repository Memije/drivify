class SessionController < ApplicationController

  # before_action :authenticate_user, only: [:new,:create]
  before_action :browser_version

  def new
    render layout: 'empty'
  end

  def create
    @user = User.find_by("LOWER(email) = ?",login_params[:email].downcase)
    if @user.present? && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Bienvenido de vuelta <b>#{@user.nombre}</b>."
      redirect_to home_path
    else
      flash.now[:error] = "La combinación de email y contraseña es incorrecta."
      render :new, layout: 'empty'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  private
  def login_params
    params.require(:login).permit(:email,:password)
  end
end
