class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path(@profile), notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to :new, notice: 'Profile was successfully destroyed.' }
    end
  end

  private

  def set_profile
    @profile = Profile.instance
  end

  def profile_params
    params.require(:profile).permit(:image, :name, :description)
  end
end