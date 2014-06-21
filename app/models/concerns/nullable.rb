module Nullable
  extend ActiveSupport::Concern

  included do
    def phone
      super || NullPhone.new
    end

    def social_media
      super || NullSocialMedia.new
    end

    def billing_address
      super || NullAddress.new
    end

    def shipping_address
      super || NullAddress.new
    end
  end
end
