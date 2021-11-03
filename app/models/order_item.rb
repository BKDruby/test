# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id            :bigint           not null, primary key
#  amount        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  order_id      :bigint
#  pizza_type_id :bigint
#
# Indexes
#
#  index_order_items_on_order_id       (order_id)
#  index_order_items_on_pizza_type_id  (pizza_type_id)
#
class OrderItem < ApplicationRecord
  belongs_to :pizza_type
  belongs_to :order

  validates :amount, numericality: { greater_than: 0 }
  validates_uniqueness_of :pizza_type_id, scope: :order_id
end
