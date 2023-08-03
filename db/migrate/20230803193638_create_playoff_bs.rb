class CreatePlayoffBs < ActiveRecord::Migration[7.0]
  def change
    create_table :playoff_bs do |t|
      t.string :team_name
      t.string :result

      t.timestamps
    end
  end
end
