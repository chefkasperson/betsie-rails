class AddWinnerToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :winner, :integer, :default => 0
    add_column :challenges, :status, :string, :default => "pending"
  end
end
