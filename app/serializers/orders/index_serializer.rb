# frozen_string_literal: true

module Orders
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :created_at, :updated_at, :total_price
  end
end
