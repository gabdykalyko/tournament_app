class CreatePlayoffs < ActiveRecord::Migration[7.0]
  def change
    create_table :playoffs do |t|
      t.string :team_name

      t.timestamps
    end
  end
end
