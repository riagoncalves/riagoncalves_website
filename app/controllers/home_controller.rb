class HomeController < ApplicationController
  def index
    @profile = Profile.instance
    @skills = Skill.all.order(:created_at)
    @contacts = Contact.all.order(:created_at)
  end
end

