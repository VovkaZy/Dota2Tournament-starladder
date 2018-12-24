# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nick       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uid        :integer
#

class User < ApplicationRecord
  has_one :team, dependent: :destroy

  validates :nick, presence: true
  validates :uid, presence: true

  def self.find_or_create_from_omniauth(auth)
    find_or_create_by(uid: auth.uid) do |user|
      user.nick  = auth.info.nick
      user.email = auth.info.email
    end
  end

  def to_s
    nick
  end

  ##
  # Whether user has a team and particularly this team if the argument is provided.
  #
  # @param [Team] team
  # @return [Boolean]
  #
  def owns_team?(team = nil)
    team ? self.team == team : self.team.present?
  end
end
