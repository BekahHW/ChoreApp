class ChoreController < ApplicationController

  get '/chore/new' do
    @chore = Chore.all
    erb :'/chore/new'
  end

end
