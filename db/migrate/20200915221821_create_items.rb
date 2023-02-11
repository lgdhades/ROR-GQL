class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, id: :uuid do |t|
      t.string :article_id
      t.boolean :deleted
      t.string :type
      t.string :by
      t.string :time
      t.string :text
      t.boolean :dead
      t.string :parent
      t.string :poll
      t.integer :kids, default: []
      t.string :url
      t.integer :score
      t.string :title
      t.integer :parts, default: []
      t.integer :descendants, default: []

      t.timestamps
    end
  end
end
