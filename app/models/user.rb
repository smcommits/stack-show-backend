class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  scope :filter_by_starts_with, ->(query) { where('lower(name) like ?', "#{query}%") }

  validates :name, presence: true
  has_many :projects, dependent: :destroy
  has_many :ratings
  has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :project
  has_many :messages
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
end
