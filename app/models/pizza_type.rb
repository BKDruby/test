# frozen_string_literal: true

# == Schema Information
#
# Table name: pizza_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PizzaType < ApplicationRecord
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
