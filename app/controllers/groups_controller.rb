class GroupsController < ApplicationController
  def index
    @groups = Group.where(author_id: current_user.id)
  end

  def new; end

  def show
    @group = Group.where(author_id: current_user, id: params[:id])[0]
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      flash[:info] = 'Created succesfully'
      redirect_to user_groups_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
