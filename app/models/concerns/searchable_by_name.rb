module SearchableByName
  extend ActiveSupport::Concern
  included do
    scope :search_name, ->(term) { where("name ilike ?", "%#{term}%") }
    scope :search_description, ->(term) { where("description ilike ?", "%#{term}%") }
  end
end
