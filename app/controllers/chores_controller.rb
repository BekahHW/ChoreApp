require 'pry'
class ChoreController < ApplicationController
  get '/chores' do
    redirect_if_not_logged_in
    @chore = Chore.all
    erb :'chores/index'
  end

  get '/chores/new' do
    redirect_if_not_logged_in
    @family_member = current_user.family_members.all
    erb :'/chores/new'
  end

  get '/chores/:id/edit' do
    redirect_if_not_logged_in
    @chore = Chore.find(params[:id])
    @family_member = current_user.family_members.all
    erb :'chores/edit'
  end

  post '/chores/:id' do
    redirect_if_not_logged_in
    @chore = Chore.find(params[:id])
    redirect "chores/#{@chore.id}"
  end

  patch '/chores/:id' do
    redirect_if_not_logged_in
    @chore = Chore.find(params[:id])
    redirect "chores/#{@chore.id}"
  end

  get '/chores/:id' do
    if logged_in?
      @chore = Chore.find(params[:id])
      erb :'/chores/show'
    else
      redirect '/chores'
    end
  end

  post '/chores' do
    redirect_if_not_logged_in
    if params[:chore] == ""
      redirect '/chores/new'
    end
    @chore = Chore.create(params[:chore])
    redirect "/chores/#{@chore.id}"
  end

  delete '/chores/:id' do
    redirect_if_not_logged_in
    @chore= Chore.find(params[:id])
    @chore.destroy
    redirect to '/chores/new'
  end


end
