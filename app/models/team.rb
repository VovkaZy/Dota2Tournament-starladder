# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  logo       :string
#

class Team < ApplicationRecord

  scope :in_tournament, ->(tournament) { tournament.teams }

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :players, dependent: :destroy
  has_many :tournaments, through: :players

  validates :name, presence: true, uniqueness: true

  mount_uploader :logo, TeamLogoUploader
end
