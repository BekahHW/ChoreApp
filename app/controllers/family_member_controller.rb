class FamilyMemberController < ApplicationController
  get '/family_member/new' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  post '/family_member/new' do
    @family_member = FamilyMember.create(:name => params[:name])
    erb :'/family_member/show'
  end

end
