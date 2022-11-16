class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(set_groups_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  private

  def set_groups_params
    params.require(:group).permit(:name, :icon)
  end
end
