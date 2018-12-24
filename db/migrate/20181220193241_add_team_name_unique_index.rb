# frozen_string_literal: true

class AddTeamNameUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :teams, :name, unique: true
  end
end
