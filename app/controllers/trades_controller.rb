class TradesController < ApplicationController
  def new
    @group = current_user.groups.find(params[:group_id])
    @trade = Trade.new
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
        redirect_to user_group_path(current_user, @group)
      else
        flash.now[:alert] = 'Trade group creation failed'
        render 'new', status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'Trade creation failed'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @group = current_user.groups.find(params[:group_id])
    @trade = current_user.trades.find(params[:id])
    @trade.destroy
    redirect_to user_group_path(current_user, @group), status: :see_other, notice: 'Trade was successfully destroyed.'
  end

  private

  def trade_params
    params.require(:trade).permit(:name, :amount)
  end
end
