class Api::V1::DevicesController < ApplicationController

  before_action :set_device, only: %i[ show update destroy ] 

  def index

    # Se há pedido de paginação, retorna paginação pedida
    # Aceita requisições: localhost:3000/api/v1/devices?page=1&per_page=10
    if(params[:page])  
      page = (params[:page] || 1).to_i
      per_page = (params[:per_page] || 10).to_i
      @devices = Device.all.page(page).per(per_page)
    # Se não há pedido de paginação, retorna todos os dispositivos
    else
      @devices = Device.all
    end
    render json: @devices  

  end

  def show

    render json: @device

  end

  def create

    @device = Device.new(device_params)

    if @device.save

      render json: @device, status: :created, location: api_v1_device_url(@device)

    else

      render json: @device.errors, status: :internal_server_error

    end

  end

  def update

    if @device.update(device_params)

      render json: @device

    else

      render json: @device.errors, status: :internal_server_error

    end

  end

  def destroy

    @device.destroy

  end

private
  
def set_device

  @device = Device.find(params[:id])

end

def device_params
  
  params.require(:device).permit(:name, :description, :user_id, :status, :request_count, :category)

end

end