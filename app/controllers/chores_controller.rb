require 'pry'
class ChoreController < ApplicationController
  get '/chores' do
    @chore = Chore.all
    erb :'chores/index'
  end

  get '/chores/new' do
    if logged_in?
      @family_member = current_user.family_members.all
      erb :'/chores/new'
    else
      redirect to '/'
    end
  end

  get '/chores/:id/edit' do
    if logged_in?
      @chore = Chore.find(params[:id])
      erb :'chores/edit'
    end
  end




  # post '/chore/:id' do
  #   @chore = Chore.find(params[:id])
  #   redirect "chore/#{@chore.id}"
  # end

  patch '/chores/:id' do
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
    if logged_in?
      if params[:chore] == ""
        redirect '/chores/new'
      end
      @family_member = FamilyMember.create(params['family_member'])
      # @family_member.save
      @chore = Chore.create(params[:chore])
      redirect "chores/#{@chore.id}"
    end
  end

  delete '/chores/:id' do
    if logged_in?
      @chore= Chore.find(params[:id])
      @chore.destroy
      redirect to '/chores/new'
    else
      erb :'users/login'
    end
  end


end
