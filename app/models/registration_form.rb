# frozen_string_literal: true

class RegistrationForm < ApplicationRecord
  belongs_to :partner
  belongs_to :sport_type

  enum record_status: { active: 0, inactive: 1, deleted: 2 }
end
