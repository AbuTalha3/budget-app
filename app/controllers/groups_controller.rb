class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @groups = Group.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @entities = Entity.all.where(group_id: @group.id).order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'category was created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'group updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
