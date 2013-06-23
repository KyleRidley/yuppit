class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :display_name
      t.string :image
      t.string :email
      t.string :phone
      t.string :slug

      t.timestamps
    end
    add_index :users, :name, :unique => true
    add_index :users, :slug, :unique => true
  end
end
