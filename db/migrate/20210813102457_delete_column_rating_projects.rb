# frozen_string_literal: true

class DeleteColumnRatingProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :rating
  end
end
