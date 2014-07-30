module Repeatable
  extend ActiveSupport::Concern

  included do
    def self.recent_first
      order(created_at: :desc)
    end
  end
end
