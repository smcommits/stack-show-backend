class Project < ApplicationRecord
  validates :title, presence: true
  serialize :stack_list, Array

  belongs_to :user
  has_many :ratings, dependent: :destroy

  def self.all_with_users_and_ratings
    projects = all.includes(:user)
    projects.map do |record|
      record.attributes.merge(
        'user' => record.user,
        'average_rating' => record.average_rating
      )
    end
  end

  def average_rating
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
