# frozen_string_literal: true

class Partner < ApplicationRecord
  enum record_status: { active: 0, inactive: 1, deleted: 2 }
end
