class ProfilesController < ApplicationController
 
before_action :authenticate_member!

layout 'profile'

  def show

  	@member = current_member
  	@profile = @member.profile

  end

  def new

    @member = current_member
    @profile = Profile.new({:member_id => @member.id})

  end


  def create

    
    @profile = Profile.new(profile_params)

    if @profile.save

      flash[:notice] = "Profile Updated Successfully"
      redirect_to(:action => 'show', :member_id => "#{current_member.id}")
    else
      
      render('edit')
    end

  end

  def edit
    
    @profile = Profile.find_by_member_id(params[:member_id])
  end

  def update
    
    @profile = Profile.find_by_member_id(params[:member_id])

    if @profile.update_attributes(profile_params)
      flash[:notice] = "Profile updated successfully."
      redirect_to profile_path(current_member.id)
    else
      @member = current_member.id
      @profile = Profile.find_by_member_id(params[:member_id])
      render('edit')
    end
  end



  private
    def profile_params
      params.require(:profile).permit( :member_id, :short_description, :about, :facebook_link, :twitter_link, :linkedin_link, :DOB, :country, :state, :city, :gender)
    end

end
