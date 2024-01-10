class CreateGroupEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :group_entities do |t|

      t.timestamps
    end
  end
end
