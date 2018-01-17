class PagesController < ApplicationController
  def index
    @stride = StrideGroup.all
  end

  def stride_data
    return unless params[:click] == 'true'
    stride_value = GroupService.new.retrieve_channel
    StrideGroup.create_automatically(stride_value)
    redirect_to root_path
  end
end
