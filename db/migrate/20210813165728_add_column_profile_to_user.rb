# frozen_string_literal: true

class AddColumnProfileToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_path, :string
  end
end
