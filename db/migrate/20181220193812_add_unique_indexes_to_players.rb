# frozen_string_literal: true

class AddUniqueIndexesToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_index :players, [:team_id, :tournament_id], unique: true
  end
end
