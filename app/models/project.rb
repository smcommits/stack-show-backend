# rubocop:disable  Layout/LineLength

class Project < ApplicationRecord
  validates :title, presence: true
  serialize :stack_list, Array

  scope :filter_by_starts_with, ->(query) { where('lower(title) like ?', "#{query}%") }

  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.with_users_and_ratings(id, current_user)
    is_favorite = current_user&.favorites&.where('project_id = ?', id)
    project = find(id)
    project.attributes.merge(
      'user' => project.user,
      'average_rating' => project.average_rating,
      'is_favorite' => is_favorite&.exists?,
      'favorite_id' => is_favorite&.first&.id || ''
    )
  end

  def self.search(query)
    query = query.downcase
    all.where('lower(title) LIKE ?', "%#{query}")
  end

  def average_rating
    return if total_coefficient_rating.zero?

    total_coefficient_rating / ratings.count
  end

  def five_stars_ratings
    ratings.where('stars = ?', 5).count
  end

  def four_stars_ratings
    ratings.where('stars = ?', 4).count
  end

  def three_stars_ratings
    ratings.where('stars = ?', 3).count
  end

  def two_stars_ratings
    ratings.where('stars = ?', 2).count
  end

  def one_stars_ratings
    ratings.where('stars = ?', 1).count
  end

  def total_coefficient_rating
    (five_stars_ratings * 5) + (four_stars_ratings * 4) + (three_stars_ratings * 3) + (two_stars_ratings * 2) + (one_stars_ratings * 1)
  end
end
# rubocop:enable Layout/LineLength
