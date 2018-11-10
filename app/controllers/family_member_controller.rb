require 'pry'
class FamilyMemberController < ApplicationController
  get '/family_member' do
    # erb :'/family_member/new'
  end

  get '/family_member/new' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  get '/family_member/:slug/edit' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    erb :'family_member/edit'
  end

  patch '/family_member/:slug' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    @family_member.update(params[:family_member])
    @family_member.save
    redirect "/family_member/#{@family_member.slug}"
  end

  get '/family_member/:slug' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    erb :'/family_member/show'
  end

  post '/family_member' do
    @family_member = FamilyMember.create(name: params[:name])
    # if !params['chore']['description'].empty? || !params['chore']['room'].empty? || !params['chore']['day'].empty?
    #   @family_member.chore << Chore.create(params['chore'])
    # end
    # @family_member.save
    redirect("/family_member/#{@family_member.slug}")
  end

  delete '/family_member/:slug' do
    if logged_in?
      @family_member = FamilyMember.find_by_slug(params[:slug])
      # @family_member = current_user.FamilyMember.find_by_slug(params[:slug])
      @family_member.destroy
      redirect to '/family_member/new'
    else
      erb :'users/login'
    end
  end



end
