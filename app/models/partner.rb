# frozen_string_literal: true

class Partner < ApplicationRecord
  enum record_status: { active: 0, inactive: 1, deleted: 2 }
  has_many :registration_forms

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: %i[
      sorted_by
      search_query
    ]
  )

  scope :search_query, lambda { |query|
    return nil if query.blank?

    terms = query.downcase.split(/\s+/)
    terms = terms.map do |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    end
    num_or_conditions = 2
    where(
      terms.map do
        or_clauses = [
          'LOWER(partners.code) LIKE ?',
          'LOWER(partners.name) LIKE ?'
        ].join(' OR ')
        "(#{or_clauses})"
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("partners.created_at #{direction}")
    when /^code_/
      order("LOWER(partners.code) #{direction}")
    when /^name_/
      order("LOWER(partners.name) #{direction}")
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }
end
