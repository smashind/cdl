require "administrate/base_dashboard"

class AttemptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    test: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    score: Field::Number,
    place: Field::Number,
    completed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    incorrect: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :test,
    :user,
    :id,
    :score,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :test,
    :user,
    :score,
    :place,
    :completed,
    :incorrect,
  ]

  # Overwrite this method to customize how attempts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(attempt)
  #   "Attempt ##{attempt.id}"
  # end
end
