# frozen_string_literal: true

# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Tournament < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :teams, through: :players

  validates :name, presence: true
end
