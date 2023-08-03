class AddDivisionToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :division, foreign_key: true, default: nil, null: true
  end
end
