# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApiController
      def model
        Order
      end

      def relations
        [:user, { order_items: :pizza_type }]
      end
    end
  end
end
