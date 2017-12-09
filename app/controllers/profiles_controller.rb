class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

respond_to :html

def index
  @profiles = Profile.all
  respond_with(@profiles)
end

def show
  @profile = Profile.find(params[:id])
  respond_with(@profile)
end

def new
  @profile = Profile.new
  respond_with(@profile)
end

def edit
end

def create
  @profile = Profile.new(profile_params)
  @profile.user_id = current_user.id
  @profile.save
  respond_with(@profile)
end

def update
  @profile.update(profile_params)
  respond_with(@profile)
end

def destroy
  @profile.destroy
  respond_with(@profile)
end

private
  def set_profile
    @profile = Profile.find(params[:id])
 end

def profile_params
  params.require(:profile).permit(:name, :civil, :email, :level, :employment_date, :mobile, :folder, :title, :internal, :nationality, :vacation, :work_email, :experience)
end
end
