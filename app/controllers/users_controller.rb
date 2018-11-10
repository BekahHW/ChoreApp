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
      @user = User.all
      erb :'/users/new'
    else
      redirect to '/chores'
    end
  end

  post '/users/new' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/users/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
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

  # get '/users/show' do
  #   if logged_in?
  #     @user = User.all
  #     erb :'/users/show'
  #   else
  #     redirect '/users/login'
  #   end
  # end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/users/login'
    else
      redirect to '/'
    end
  end





end
