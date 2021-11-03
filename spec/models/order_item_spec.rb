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
require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
