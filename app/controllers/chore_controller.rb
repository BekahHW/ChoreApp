require 'pry'
require 'rack-flash'

class ChoreController < ApplicationController
  use Rack::Flash
  get '/chore' do
    @chore = Chore.all
    erb :'chore/index'
  end

  get '/chore/new' do
    @chore = Chore.all
    erb :'/chore/new'
  end

  get '/chore/:id/edit' do
    if logged_in?
      @chore = Chore.find(params[:id])
      erb :'chore/edit'
    end
  end

  post '/chore/:id' do
    @chore = Chore.find(params[:id])
    @chore.update(params['chore'])
    # if !params['family_member']['name'].empty?
    #   @chore.family_member << FamilyMember.create(name: params['family_member']['name'])
    # end
    @chore.save
    redirect "chore/#{@chore.id}"
  end

  patch '/chore/:id' do
    @chore = Chore.find(params[:id])
    # @family_member.update(params[:family_member])
    redirect "chore/#{@chore.id}"
  end

  get '/chore/:id' do
    if logged_in?
      @chore = Chore.find_by_id(params[:id])
      # @chore.description = params[:description]
      # @chore.room = params[:room]
      # @chore.day = params[:day]
      # @chore.save
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
      @chore = Chore.create(params[:chore])
      # @chore.family_member_id = current_user.id

      if !params['family_member']['name'].empty?
        flash[:message] = "You must choose a family member."
        redirect '/chore/new'
      end
      # @chore.family_member << Chore.create(:description => params['chore']['description'], :room => params['chore']['room'], :day => params['chore']['day'])
      # # end
      # @chore.save
      redirect "chore/#{@chore.id}"
    end
  end

  delete '/chore/:id' do
    if logged_in?
      @chore= Chore.find(params[:id])
      # @family_member = current_user.FamilyMember.find_by_slug(params[:slug])
      @chore.destroy
      redirect to '/chore/new'
    else
      erb :'users/login'
    end
  end

end
