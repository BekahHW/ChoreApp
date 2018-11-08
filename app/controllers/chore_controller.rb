require 'pry'
class ChoreController < ApplicationController

  get '/chore/new' do
    @chore = Chore.all
    erb :'/chore/new'
  end

  post '/chore' do
    if logged_in?
      if params[:chore] == ""
        redirect '/chore/new'
      end
      @chore = Chore.create(params[:chore])
      @chore.family_member_id = current_user.id

      # if !params['family_member']['name'].empty?
      #   @chore.family_member << Chore.create(:description => params['chore']['description'], :room =>['chore']['room'], :day =>['chore']['day'])
      # end
      @chore.save
      redirect "chore/#{@chore.id}"
    end
  end


  get '/chore/:id' do
    if logged_in?
      @chore = Chore.find_by_id(params[:id])
      @chore.description = params[:description]
      @chore.room = params[:room]
      @chore.day = params[:day]
      @chore.save
      erb :'/chore/show'
    else
      redirect '/chore'
    end
  end

end
