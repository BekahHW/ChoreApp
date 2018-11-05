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
      redirect '/login'
    else
      redirect '/failure'
    end
  end

  post '/users/login' do
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
