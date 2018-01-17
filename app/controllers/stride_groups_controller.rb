class StrideGroupsController < ApplicationController
  before_action :set_stride_group, only: [:edit, :update]
  
  def edit; end

  def update
    if @stride.update_attributes(stride_group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def stride_group_params
    params.require(:stride_group).permit(
      :starts_at, :archived, :message, :action_type
    )
  end

  def set_stride_group
    @stride = StrideGroup.find_by(id: params[:id])
  end
end
