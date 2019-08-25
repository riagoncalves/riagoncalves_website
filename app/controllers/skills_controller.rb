class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
  end

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

  def set_skill
    @skill = Skill.find(params[:id])
  end
end