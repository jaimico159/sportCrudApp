class RegistrationForm < ApplicationRecord
  belongs_to :partner
  belongs_to :sport_type
end
