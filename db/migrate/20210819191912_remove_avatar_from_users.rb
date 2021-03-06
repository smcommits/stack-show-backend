# frozen_string_literal: true

class RemoveAvatarFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avatar_path
  end
end
