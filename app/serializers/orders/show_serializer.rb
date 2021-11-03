# frozen_string_literal: true

module Orders
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :created_at, :updated_at, :total_price, :order_items
  end
end
