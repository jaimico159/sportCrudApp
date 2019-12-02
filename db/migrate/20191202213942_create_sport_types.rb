# frozen_string_literal: true

class CreateSportTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sport_types do |t|
      t.string :code, index: true, null: false
      t.string :name
      t.integer :record_status

      t.timestamps
    end
  end
end
