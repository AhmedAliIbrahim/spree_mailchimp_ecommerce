# frozen_string_literal: true

module SpreeMailchimpEcommerce
  module Presenters
    class LineMailchimpPresenter
      attr_reader :line

      def initialize(line)
        @line = line
      end

      def json
        {
          id: Digest::MD5.hexdigest("#{line.id}#{line.order_id}"),
          product_id: ProductMailchimpPresenter.new(line.product).json["id"],
          product_variant_id: Digest::MD5.hexdigest("#{line.variant.sku}#{line.variant.id}"),
          quantity: line.quantity,
          price: line.price.to_s
        }
      end
    end
  end
end
