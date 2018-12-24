# frozen_string_literal: true

class AddNameToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :name, :string
  end
end
