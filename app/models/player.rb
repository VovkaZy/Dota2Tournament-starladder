# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  team_id       :integer
#  tournament_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Player < ApplicationRecord
  belongs_to :team
  belongs_to :tournament

  validates :team_id,       uniqueness: { scope: %i[team_id tournament_id] }
  validates :tournament_id, uniqueness: { scope: %i[team_id tournament_id] }
end
