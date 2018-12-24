# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.belongs_to :team, foreign_key: true
      t.belongs_to :tournament, foreign_key: true

      t.timestamps
    end
  end
end
