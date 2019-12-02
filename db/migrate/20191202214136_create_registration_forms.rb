# frozen_string_literal: true

class CreateRegistrationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_forms do |t|
      t.integer :form_number, index: true, null: false
      t.references :partner, foreign_key: true
      t.references :sport_type, foreign_key: true
      t.integer :record_status

      t.timestamps
    end
  end
end
