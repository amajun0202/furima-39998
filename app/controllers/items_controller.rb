class ItemsController < ApplicationController

  def index
    
  end


  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :shipping_cost_id, :origin_region_id, :shipping_day_id, :item_name, :description, :cost ).merge(user_id: current_user.id)
  end

  end
