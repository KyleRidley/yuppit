class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :category
      t.text :body
      t.references :user
      t.string :slug

      t.timestamps
    end
    add_index :ideas, :user_id
    add_index :ideas, :slug, :unique => true
  end
end
