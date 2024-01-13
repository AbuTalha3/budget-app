class CreateUsersses < ActiveRecord::Migration[7.1]
  def change
    create_table :usersses do |t|

      t.timestamps
    end
  end
end
