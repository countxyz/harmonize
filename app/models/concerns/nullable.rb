module Nullable
  extend ActiveSupport::Concern

  included do
    def phone
      super || NullObject.new
    end

    def social_media
      super || NullObject.new
    end

    def billing_address
      super || NullObject.new
    end

    def shipping_address
      super || NullObject.new
    end
  end

  def method_missing(*args, &block)
    self
  end
end
