require 'pry'
class FamilyMemberController < ApplicationController
  get '/family_member/new' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  get '/family_member/:slug' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    erb :'/family_member/show'
  end

  get '/family_member/:slug/edit' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    erb :'family_member/edit'
  end

  post '/family_member/new' do
    @family_member = FamilyMember.find_or_create_by(:name => params[:name])
    # if !params['chore']['description'].empty?

    # @family_member.chore = Chore.create(params['chore'])
    # end
    @family_member.save
    redirect("/family_member/#{@family_member.slug}")
  end

  patch '/family_member/:slug' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    @family_member.update(params[:family_member])
    @family_member.save
    erb :'/family_member/show'
  end

  delete '/family_member/:slug' do
    if logged_in?
      @family_member = FamilyMember.find_by_slug(params[:slug])
      # @family_member = current_user.FamilyMember.find_by_slug(params[:slug])
      @family_member.destroy
      erb :'/family_member/show'
    else
      erb :'users/login'
    end
  end



end
