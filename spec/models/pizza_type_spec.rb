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
require 'rails_helper'

RSpec.describe PizzaType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
