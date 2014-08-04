module Repeatable
  extend ActiveSupport::Concern

  included do
    scope :recent_first, -> { order(created_at: :desc) }
  end
end
