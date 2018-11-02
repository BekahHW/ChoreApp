class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :new
  end

  post '/users/new' do
    @user = User.new(:username => params[:username], :email => params[:username], :password => params[:password])

    if @user.save
      redirect '/users/index'
    else
      redirect '/failure'
    end
  end

  post '/users/index' do
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
      redirect '/users/index'
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
