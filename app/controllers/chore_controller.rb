require 'pry'
class ChoreController < ApplicationController
  get '/chore' do
    @chore = Chore.all
    erb :'chore/index'
  end

  get '/chore/new' do
    if logged_in?
      # @chore = Chore.all
      # @family_member = FamilyMember.all
      erb :'/chore/new'
    else
      redirect to '/'
    end
  end

  get '/chore/:id/edit' do
    if logged_in?
      @chore = Chore.find(params[:id])
      erb :'chore/edit'
    end
  end

  post '/chore/:id' do
    @chore = Chore.find(params[:id])
    # @chore.update(params['chore'])
    # @chore.save
    redirect "chore/#{@chore.id}"
  end

  patch '/chore/:id' do
    @chore = Chore.find(params[:id])
    redirect "chore/#{@chore.id}"
  end

  get '/chore/:id' do
    if logged_in?
      @chore = Chore.find(params[:id])
      erb :'/chore/show'
    else
      redirect '/chore'
    end
  end

  post '/chore' do
    if logged_in?
      if params[:chore] == ""
        redirect '/chore/new'
      end
      if !params['family_member']['name'].empty?
        @chore.family_member.name= FamilyMember.create(name: params['family_member']['name'])
      end
      @chore = Chore.find_or_create_by(params[:chore])
      # @family_member = FamilyMember.all
      redirect "chore/#{@chore.id}"
    end
  end

  delete '/chore/:id' do
    if logged_in?
      @chore= Chore.find(params[:id])
      @chore.destroy
      redirect to '/chore/new'
    else
      erb :'users/login'
    end
  end


end
