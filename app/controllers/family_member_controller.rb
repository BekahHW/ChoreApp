class FamilyMemberController < ApplicationController
  get '/family_members/new' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  post '/family_members/new' do
    @family_member = FamilyMember.new(:name => params[:name])
    erb :'/family_member/show'
  end

end
