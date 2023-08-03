class CreatePlayoffDivisionB12s < ActiveRecord::Migration[7.0]
  def change
    create_table :playoff_division_b12s do |t|
      t.string :team_name
      t.string :result

      t.timestamps
    end
  end
end
