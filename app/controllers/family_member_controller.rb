class FamilyMemberController < ApplicationController
  get '/family_member/new' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  post '/family_member/new' do
    @family_member = FamilyMember.create(:name => params[:name])
    erb :'/family_member/show'
  end

  get '/family_member/edit' do
    @family_member = FamilyMember.find(params[:slug])
    erb :'family_member/edit'
  end

  patch '/family_member/:id' do
    @family_member = FamilyMember.find(params[:slug])
    erb :'/family_member/show'
  end

  delete '/family_member/:id/delete' do
    if logged_in?
      @family_member = FamilyMember.find(params[:slug])
      @family_member.destroy
      redirect '/family_member'
    else
      erb :'users/login'
    end
  end
end
