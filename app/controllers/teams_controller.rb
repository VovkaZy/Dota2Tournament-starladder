# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, only: %i[edit update destroy]
  before_action :set_tournament, only: [:index]
  before_action :check_user, only: %i[new create edit update destroy]

  def index
    @teams = @tournament ? Team.in_tournament(@tournament) : Team.all
  end

  def new
    @team = current_user.build_team
  end

  def edit; end

  def create
    @team = current_user.build_team(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path, notice: 'Successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to teams_path, notice: 'Successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Successfully destroyed' }
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def set_tournament
    @tournament = params[:tournament_id].present? ? Tournament.find(params[:tournament_id]) : nil
  end

  def check_user
    if !logged_in? || creating_another_team? || editing_another_team?
      redirect_to root_path, notice: 'You have no permission for this action!'
    end
  end

  ##
  # User already has a team and creates new one.
  #
  def creating_another_team?
    %w[new create].include?(action_name) && current_user.owns_team?
  end

  ##
  # User editing team which he does not own.
  #
  def editing_another_team?
    %w[edit update destroy].include?(action_name) && (current_user.team.try(:id) != params[:id].to_i)
  end

  def team_params
    params.require(:team).permit(:name, :team_id, :logo, :tournament_id)
  end
end
