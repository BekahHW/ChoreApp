require 'pry'
class FamilyMemberController < ApplicationController
  get '/family_members' do
    redirect_if_not_logged_in
    @family_member = FamilyMember.all
    erb :'/family_members/new'
  end

  get '/family_members/new' do
    redirect_if_not_logged_in
    erb :'/family_members/new'
  end

  get '/family_members/:id/edit' do
    redirect_if_not_logged_in
    @family_member = FamilyMember.find(params[:id])
    # @family_member = current_user.family_members.find(params[:id])
    erb :'family_members/edit'
  end

  post '/family_members/:id' do
    # restful version of post creates wihtout id
    # post fmaily_members
    redirect_if_not_logged_in

    @family_member = FamilyMember.find(params[:id])
    redirect "/family_members/#{@family_member.id}"
  end

  patch '/family_members/:id' do
    redirect_if_not_logged_in
    @family_member = FamilyMember.find(params[:id])
    @family_member.update(params[:family_member])
    redirect "/family_members/#{@family_member.id}"
  end

  get '/family_members/:id' do
    redirect_if_not_logged_in
    @family_member = FamilyMember.find(params[:id])
    erb :'/family_members/show'
  end

  post '/family_members' do
    redirect_if_not_logged_in
    @family_member = current_user.family_members.build(params)
    @family_member.save
    redirect("/family_members/#{@family_member.id}")
  end

  delete '/family_members/:id' do
    if logged_in?
      @family_member = FamilyMember.find_by_id(params[:id])
      # @family_member = current_user.FamilyMember.find_by_slug(params[:slug])
      @family_member.destroy
      redirect to '/family_members/new'
    else
      erb :'users/login'
    end
  end



end
