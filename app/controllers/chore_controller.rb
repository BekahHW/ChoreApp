require 'pry'
class ChoreController < ApplicationController

  get '/chore/new' do
    @chore = Chore.all
    erb :'/chore/new'
  end

  post '/chore' do
    @chore = Chore.create(params[:chore])

    # if !params['family_member']['name'].empty?
    #   @chore.family_member << Chore.create(:description => params['chore']['description'], :room =>['chore']['room'], :day =>['chore']['day'])
    # end
    @chore.save
    binding.pry
    redirect "chore/#{@chore.id}"
  end


  patch '/chore/:id' do

    @chore = Chore.find_by_id(params[:id])
    @chore.description = params[:description]
    @chore.room = params[:room]
    @chore.day = params[:day]
    @chore.save
    erb :'/chore/show'
  end
end
