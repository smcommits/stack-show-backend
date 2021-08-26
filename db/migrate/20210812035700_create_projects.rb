# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.text :github_url
      t.text :live_demo
      t.belongs_to :user
      t.timestamps
    end
  end
end
