class UsersController < ApplicationController

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(:username => params[:username], :email => params[:username], :password => params[:password])

    if @user.save
      redirect '/users/login'
    else
      redirect '/users/failure'
    end
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/success'
    else
      redirect '/users/failure'
    end
  end

  get '/success' do
    if logged_in?
      erb :success
    else
      redirect '/users/login'
    end
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
