class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
  end

  def create
    (1..16).each do |i|
      team = Team.create(name: params["team_#{i}"])
      puts "Team #{i} saved: #{team.persisted?}"
    end
    redirect_to root_path, notice: "Команды успешно созданы!"
  end

  def clear_all
    Team.destroy_all
    PlayoffA.destroy_all
    PlayoffB.destroy_all
    PlayoffDivisionA12.destroy_all
    PlayoffDivisionB12.destroy_all
    PlayoffFinal.destroy_all
    PlayoffWinner.destroy_all

    redirect_to root_path, notice: "Все команды были успешно очищены!"
  end

  def distribute_divisions
    division_a = Division.find_or_create_by(name: "Division A")
    division_b = Division.find_or_create_by(name: "Division B")

    @teams = Team.order("RANDOM()").to_a

    @teams.each_slice(8).with_index do |teams_slice, index|
      division = index == 0 ? division_a : division_b
      teams_slice.each { |team| team.update(division: division) }
    end

    redirect_to divisions_path, notice: "Команды успешно распределены по дивизионам!"
  end
end
