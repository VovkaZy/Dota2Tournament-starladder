# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_20_193812) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'players', force: :cascade do |t|
    t.bigint 'team_id'
    t.bigint 'tournament_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[team_id tournament_id],
            name: 'index_players_on_team_id_and_tournament_id',
            unique: true
    t.index ['team_id'], name: 'index_players_on_team_id'
    t.index ['tournament_id'], name: 'index_players_on_tournament_id'
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'logo'
    t.index ['name'], name: 'index_teams_on_name', unique: true
    t.index ['user_id'], name: 'index_teams_on_user_id'
  end

  create_table 'tournaments', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'nick'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'uid'
  end

  add_foreign_key 'players', 'teams'
  add_foreign_key 'players', 'tournaments'
  add_foreign_key 'teams', 'users'
end
