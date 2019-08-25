class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all.order(:name)
  end

  def show
  end
  
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to skills_path, notice: 'Skill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skills_path, notice: 'Skill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_path, notice: 'Skill was successfully destroyed.' }
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:icon, :name)
  end
end