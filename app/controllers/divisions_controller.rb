class DivisionsController < ApplicationController
  def index
    @division_a_teams = Team.where(division: Division.find_by(name: "Division A"))
    @division_b_teams = Team.where(division: Division.find_by(name: "Division B"))
    @playoff_a_results = PlayoffA.all
    @playoff_b_results = PlayoffB.all
    @playoff_a12_results = PlayoffDivisionA12.all
    @playoff_b12_results = PlayoffDivisionB12.all
    @final_result = PlayoffFinal.all
    @winner_result = PlayoffWinner.first
  end

  def generate_division_a_result
    division_a_teams = Team.where(division: Division.find_by(name: "Division A")).sample(4)

    PlayoffA.destroy_all

    division_a_teams.each do |team|
      PlayoffA.create(team_name: team.name)
    end

    @division_a_playoff_results = PlayoffA.all

    redirect_to divisions_path, notice: "Результаты Playoff для Division A были сгенерированы!"
  end

  def generate_division_b_result
    division_b_teams = Team.where(division: Division.find_by(name: "Division B")).sample(4)

    PlayoffB.destroy_all

    division_b_teams.each do |team|
      PlayoffB.create(team_name: team.name)
    end

    redirect_to divisions_path, notice: "Результаты Playoff для Division B были сгенерированы!"
  end

  def generate_playoff_results
    playoff_a_teams = PlayoffA.all.sample(2)
    PlayoffDivisionA12.destroy_all

    playoff_a_teams.each do |team|
      PlayoffDivisionA12.create(team_name: team.team_name)
    end

    playoff_b_teams = PlayoffB.all.sample(2)
    PlayoffDivisionB12.destroy_all

    playoff_b_teams.each do |team|
      PlayoffDivisionB12.create(team_name: team.team_name)
    end

    # Generate Final Results
    playoff_a12_teams = PlayoffDivisionA12.all.sample(1)
    playoff_b12_teams = PlayoffDivisionB12.all.sample(1)
    PlayoffFinal.destroy_all

    final_team_a = playoff_a12_teams.first
    final_team_b = playoff_b12_teams.first
    PlayoffFinal.create(team_name: final_team_a.team_name)
    PlayoffFinal.create(team_name: final_team_b.team_name)

    # Generate Winner Results
    final_teams = PlayoffFinal.all.sample(1)
    PlayoffWinner.destroy_all

    final_teams.each do |team|
      PlayoffWinner.create(team_name: team.team_name)
    end

    redirect_to divisions_path, notice: "Все результаты Playoff были сгенерированы!"
  end
end
