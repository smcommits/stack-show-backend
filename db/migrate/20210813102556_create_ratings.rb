# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
