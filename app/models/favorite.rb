class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def self.current_user_favorites(current_user)
    favorites = current_user.favorite_projects
    favorites.map do |record|
      record.attributes.merge(
        'user' => record.user,
        'average_rating' => record.average_rating
      )
    end
  end
end
