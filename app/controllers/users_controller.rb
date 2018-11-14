class UsersController < ApplicationController

  get '/users/login' do
    if !session[:user_id]
      erb :'/users/login'
    else
      redirect '/family_member'
    end
  end

  get '/users/new' do
    if !session[:user_id]
      erb :'/users/new'
    else
      redirect to '/chores'
    end
  end

  post '/users/new' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/users/new'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      @user.save
      redirect '/family_member/new'
    end
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/family_member/new'
    else
      erb :'/users/failure'
    end
  end

  get '/users/index' do
    if logged_in?
      @user = User.all
      erb :'/users/index'
    else
      redirect '/users/login'
    end
  end


  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if !@user.nil? && @user == current_user
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
