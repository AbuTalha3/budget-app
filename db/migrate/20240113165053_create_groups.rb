class CreateGroupses < ActiveRecord::Migration[7.1]
  def change
    create_table :groupses do |t|

      t.timestamps
    end
  end
end
