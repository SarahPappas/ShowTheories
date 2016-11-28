class CreateTheories < ActiveRecord::Migration[5.0]
  def change
    create_table :theories do |t|
      t.string :content
      t.string :authorName
      t.number :upvotesCount
      t.number :downVotesCount

      t.timestamps
    end
  end
end
