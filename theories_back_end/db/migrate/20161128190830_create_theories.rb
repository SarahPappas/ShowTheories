class CreateTheories < ActiveRecord::Migration[5.0]
  def change
    create_table :theories do |t|
      t.text :content
      t.string :authorName
      t.integer :upvotesCount
      t.integer :downvotesCount

      t.timestamps
    end
  end
end
