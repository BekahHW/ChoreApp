class ChoreController < ApplicationController

  get '/chore/new' do
    @chore = Chore.all
    erb :'/chore/new'
  end

  post '/chore' do
    @chore = FamilyMember.create(params[:chore])
    if !params['family_member']['name'].empty?
      @chore.family_member << Chore.create(name: params['chore']['type'])
    end
    @chore.save
    redirect "chore/#{@chore.id}"
  end

end
