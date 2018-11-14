require 'pry'
class FamilyMemberController < ApplicationController
  get '/family_member' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  get '/family_member/new' do
    if logged_in?
      # @family_member = FamilyMember.all
      erb :'/family_member/new'
    else
      redirect to '/'
    end
  end

  get '/family_member/:id/edit' do
    @family_member = FamilyMember.find(params[:id])
    # @family_member = current_user.family_members.find(params[:id])
    erb :'family_member/edit'
  end

  post '/family_member/:id' do
    # restful version of post creates wihtout id
    # post fmaily_members
    @family_member = FamilyMember.find(params[:id])
    redirect "/family_member/#{@family_member.id}"
  end

  patch '/family_member/:id' do
    @family_member = FamilyMember.find(params[:id])
    @family_member.update(params[:family_member])
    redirect "/family_member/#{@family_member.id}"
  end

  get '/family_member/:id' do
    @family_member = FamilyMember.find(params[:id])
    erb :'/family_member/show'
  end

  post '/family_member' do
    @family_member = current_user.family_members.build(params)
    @family_member.save
    redirect("/family_member/#{@family_member.id}")
  end

  delete '/family_member/:id' do
    if logged_in?
      @family_member = FamilyMember.find_by_id(params[:id])
      # @family_member = current_user.FamilyMember.find_by_slug(params[:slug])
      @family_member.destroy
      redirect to '/family_member/new'
    else
      erb :'users/login'
    end
  end



end
