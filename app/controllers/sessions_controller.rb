class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in, only: [:new, :create]
  layout 'sessions'

  def create
    flash = {}
    auth = request.env["omniauth.auth"]
    user = User.where(email: auth[:info][:email]).first

    if auth[:extra][:id_info][:email_verified] && user.present?
      session[:user_id] = user.id
      session[:user_email] = user.email
      redirect_to root_path, :flash => { :success => "Bem-Vindo!" }
    else
      reset_session
      redirect_to signin_path, :flash => { :error => "Login não permitido"}
    end
  end

  def destroy
    reset_session
    redirect_to signin_path, :flash => { :logged_out => "Saia da sua conta do Google!"}
  end

  def new
  end

end
