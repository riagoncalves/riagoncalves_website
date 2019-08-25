class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.instance
    Profile.first || Profile.create(name: 'Full Name', description: 'Job Title')
  end
end
