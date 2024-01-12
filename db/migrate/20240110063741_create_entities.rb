# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
