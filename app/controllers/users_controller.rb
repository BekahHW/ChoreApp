class UsersController < ApplicationController

  get '/users/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/family_members/new'
    end
  end

  get '/users/new' do
    if !logged_in?
      erb :'/users/new'
    else
      redirect to '/family_members/new'
    end
  end

  post '/users/new' do
    if params[:username] != "" && params[:password] != "" &&
      User.all.all?  {|e| e.username != params[:username] }
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      @user.save
      redirect '/family_members/new'
    else
      redirect '/users/login'
    end
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/family_members/new'
    else
      redirect '/users/failure'
    end
  end

  get '/users/index' do
    redirect_if_not_logged_in
    @user = User.all
    erb :'/users/index'
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if @user && @user == current_user
      erb :'/users/show'
    else redirect '/users/login'
    end
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      erb :'/users/login'
    end
  end

end
