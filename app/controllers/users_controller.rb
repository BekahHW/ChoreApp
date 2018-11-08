class UsersController < ApplicationController

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/new' do
    @user = User.all
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      redirect '/family_member/new'
    else
      redirect '/users/new'
    end
  end

  post '/users/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/family_member/new'
    else
      redirect '/users/failure'
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
    session.clear
    redirect '/'
  end





end
