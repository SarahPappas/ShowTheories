class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :theory, foreign_key: true
      t.string :ipAddress

      t.timestamps
    end
  end
end
