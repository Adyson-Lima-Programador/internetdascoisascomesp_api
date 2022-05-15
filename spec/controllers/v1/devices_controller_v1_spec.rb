require 'rails_helper'

RSpec.describe Api::V1::DevicesController, type: :controller do

  before {
    
    @user = User.create(name:"Jose",email:"jose@gmail.com",password:"123",category:"admin")
    @device = Device.create(name: "ESP8266", description: "Controle de luzes", user_id: 1, status: "0", request_count: 122, category: "interruptor")
  
  }

  describe "GET /api/v1/devices" do

    it "Consegue listar todos os dispositivos e retorna status 200" do
      
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)

    end

  end
  
  describe "GET /api/v1/devices/{id}" do

    it "Consegue listar um dispositivo especifico e retorna status 200" do

      get :show, params: {id: @device.id}
      expect(response.body).to include_json(id: @device.id)
      expect(response).to have_http_status(200)

    end

  end

  describe "POST /api/v1/devices" do

    it "Consegue criar um dispositivo e retorna status 201" do

      post :create, params: {device: {name: @device.name, description: @device.description, user_id: @device.user_id, status: @device.status, request_count: @device.request_count, category: @device.category }, format: :json}
      expect(response.body).to include_json(name: @device.name, description: @device.description, user_id: @device.user_id, status: @device.status, request_count: @device.request_count, category: @device.category)
      expect(response).to have_http_status(201)

    end

  end

  describe "PATCH /api/v1/devices/{id}" do

    it "Consegue atualizar um dispositivo e retorna status 200" do

      device = Device.last
      patch :update, params: {device: {name: "Controle central", description: @device.description, user_id: @device.user_id, status: @device.status, request_count: @device.request_count, category: @device.category }, id: device.id}
      expect(response.body).to include_json(name: "Controle central")
      expect(response).to have_http_status(200)
    end

  end

end