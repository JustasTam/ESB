class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
    	t.string :name
    	t.string :user_password
      t.string :template
      t.string :theme

      t.timestamps
    end
  end

  def down
  	execute 'DROP TABLE users'
  end
end
