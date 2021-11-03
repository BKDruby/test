# frozen_string_literal: true

class OrdersController < BaseController
  def index
    @orders = Order.all.page(params[:page] || 1).includes(:user, order_items: :pizza_type)
  end

  def new
    @order = Order.new
  end

  def create
    current_user.orders.create!(order_params.merge(order_items_attributes: clean_duplicates(order_params)))

    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.message

    redirect_to action: :new
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: %i[amount pizza_type_id _destroy])
  end

  def clean_duplicates(params)
    params[:order_items_attributes].values
                                   .group_by { |item| item['pizza_type_id'] }
                                   .each_with_object({}) do |o, memo|
      memo[o.first] =
        o.last.first.merge('amount' => sum_of_amounts(o.last))
    end
  end

  def sum_of_amounts(items)
    items.map { |i| i['amount'].to_i }.inject(:+)
  end
end
