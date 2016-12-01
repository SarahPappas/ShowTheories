class AddShowTitleToTheories < ActiveRecord::Migration[5.0]
  def change
    add_column :theories, :showTitle, :string
  end
end
