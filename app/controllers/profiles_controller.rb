class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end
  
  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end