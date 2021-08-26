# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :github_url, :live_demo, :stack_list, :average_rating, :image_path
  belongs_to :user
end
