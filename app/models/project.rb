class Project < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  def self.all_with_users
    projects = all.includes(:user)
    projects.map do |record|
      record.attributes.merge(
        'user' => record.user
      )
    end
  end
end
