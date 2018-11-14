require './config/environment'
# require './app/models/user'

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
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    # def login(user_id, password)
    #   session[:user_id] = user.id
    # end
    #
    # def logout!
    #   s ession.clear
    # end

    #    def self.current_user(session)
    #   @user = User.find_by_id(session[:user_id])
    # end
  end

end
