class CreateGroupEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :group_entities do |t|
      t.references :entity, foreign_key: true
      t.references :group, foreign_key: true      
      
      t.timestamps
    end
  end
end
