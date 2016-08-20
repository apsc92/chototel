class TerritoriesController < ApplicationController

  def index
    @territories = Territory.all
    @order_targets = Territory.aggregated_order_targets
    @orders_booked = Territory.aggregated_orders_booked
  end

end
