class TradesController < ApplicationController
  def new
  end

  def show
  end

  def index
    @group = current_user.groups.find(params[:group_id])
    @trades = @group.trades
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @trade = current_user.trades.create(trade_params)
    if @trade.save
      @trade_groups = @trade.trade_groups.create(group_id: @group.id, trade_id: @trade.id)
      if @trade_groups.save
        flash[:notice] = 'New transaction created successfully'
        redirect_to user_group_trades_path(current_user, @group)
      else
        flash.now[:alert] = 'Trade group creation failed'
        render 'new', status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'Trade creation failed'
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def trade_params
      params.require(:trade).permit(:name, :amount)
    end
end
