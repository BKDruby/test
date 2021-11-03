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
FactoryBot.define do
  factory :order_item do
    
  end
end
