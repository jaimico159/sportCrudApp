json.extract! registration_form, :id, :form_number, :partner_id, :sport_type_id, :record_status, :created_at, :updated_at
json.url registration_form_url(registration_form, format: :json)
