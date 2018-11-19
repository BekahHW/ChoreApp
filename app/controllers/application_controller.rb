require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'family_member_security'
  end

  get '/' do
    erb :index
  end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/users/login?error=Please log in first"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
