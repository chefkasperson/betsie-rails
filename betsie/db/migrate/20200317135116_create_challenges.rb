class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :challenger_id
      t.belongs_to :wager, null: false, foreign_key: true
      t.belongs_to :payment, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
