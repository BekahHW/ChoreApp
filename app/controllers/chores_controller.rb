require 'pry'
class ChoreController < ApplicationController
  get '/chores' do
    @chore = Chore.all
    erb :'chore/index'
  end

  get '/chores/new' do
    if logged_in?
      @family_member = current_user.family_members.all
      erb :'/chore/new'
    else
      redirect to '/'
    end
  end

  get '/chores/:id/edit' do
    if logged_in?
      @chore = Chore.find(params[:id])
      erb :'chore/edit'
    end
  end




  # post '/chore/:id' do
  #   @chore = Chore.find(params[:id])
  #   redirect "chore/#{@chore.id}"
  # end

  patch '/chores/:id' do
    @chore = Chore.find(params[:id])

    redirect "chore/#{@chore.id}"
  end

  get '/chores/:id' do
    if logged_in?
      @chore = Chore.find(params[:id])

      erb :'/chore/show'
    else
      redirect '/chore'
    end
  end

  post '/chores' do
    if logged_in?
      if params[:chore] == ""
        redirect '/chore/new'
      end
      @family_member = FamilyMember.create(params['family_member'])
      # @family_member.save
      @chore = Chore.create(params[:chore])
      redirect "chore/#{@chore.id}"
    end
  end

  delete '/chores/:id' do
    if logged_in?
      @chore= Chore.find(params[:id])
      @chore.destroy
      redirect to '/chore/new'
    else
      erb :'users/login'
    end
  end


end
