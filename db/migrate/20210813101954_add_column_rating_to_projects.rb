# frozen_string_literal: true

class AddColumnRatingToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :rating, :integer
  end
end
