class FamilyMemberController < ApplicationController
  get '/family_member/new' do
    @family_member = FamilyMember.all
    erb :'/family_member/new'
  end

  post '/family_member/new' do
    @family_member = FamilyMember.create(:name => params[:name])
    if !params['chore']['type'].empty?
      @family_member.chore = Chore.create(:type => params['chore']['type'])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end




  get '/family_member/edit' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    binding.pry
    erb :'family_member/edit'
  end

  patch '/family_member/:slug' do
    @family_member = FamilyMember.find_by_slug(params[:slug])
    @family_member.update(params[:family_member])
    @family_member.save
    erb :'/family_member/show'
  end

  delete '/family_member/:slug/delete' do
    if logged_in?
      @family_member = FamilyMember.find_by_slug(params[:slug])
      @family_member.destroy
      erb :'/family_member/show'
    else
      erb :'users/login'
    end
  end

end
