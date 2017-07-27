class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def compute_additional_costs_per_unit
    @order.additional_costs_per_unit = @order.additional_costs.to_f / @order.qtty
    @order.save
    update_order_lines_total_costs_per_unit
  end

  def update_order_lines_total_costs_per_unit
    @order.order_lines.each do |ol|
      ol.total_costs_per_unit = ol.production_cost_per_unit_accounting_currency + @order.additional_costs_per_unit
      ol.arrival_in_stock_date = @order.arrival_in_stock_date
      ol.save
    end
  end
end
