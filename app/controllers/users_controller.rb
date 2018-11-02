class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])

    if @user.save
      redirect '/login'
    else
      redirect '/failure'
    end
  end
    post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/success'
    else
      redirect '/failure'
    end
  end

  get '/success' do
    if logged_in?
      erb :success
    else
      redirect '/login'
    end
  end

  get '/failure' do
    erb :failure
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
