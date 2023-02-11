class RenameItemToArticle < ActiveRecord::Migration[6.0]
  def up
    rename_table :items, :articles
  end

  def down
    rename_table :articles, :items
  end
end
