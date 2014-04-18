class CreateTables < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
    end
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :role_id
    end
    create_table :files do |t|
      t.string :security_level
      t.integer :user_id
    end
  end
end
