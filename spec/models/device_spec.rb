require 'rails_helper'

RSpec.describe Device, type: :model do

  before {     
    
    @device = Device.new
    @user = User.create(id:1,name:"Jose",email:"jose@gmail.com",password:"123",category:"admin")
      
   }
  
  describe "Teste de preenchimento dos campos do model Device" do
    
    it "name preenchido" do
      @device.name = "Controle de luz"
      expect(@device.name).to eq("Controle de luz")
    end

    it "description preenchido" do
      @device.description = "Controle de luzes da casa"
      expect(@device.description).to eq("Controle de luzes da casa")
    end

    it "user_id preenchido" do
      @device.user_id = 1
      expect(@device.user_id).to eq(1)
    end

    it "status preenchido" do
      @device.status = "0"
      expect(@device.status).to eq("0")
    end

    it "request_count preenchido" do
      @device.request_count = 1200
      expect(@device.request_count).to eq(1200)
    end

    it "category preenchido" do
      @device.category = "send"
      expect(@device.category).to eq("send")
    end

  end

  describe "Teste de validação do model Device de acordo com documentação" do

    it "Device valido com campos obrigatorios preenchidos" do
            
      @device.name = "Controle de luz"
      @device.description = "Controle de luzes da casa"
      @device.user_id = @user.id
      @device.status = "0"
      @device.request_count = 1200
      @device.category = "send"
      expect(@device).to be_valid
            
    end

    it "Device invalido com campos obrigatorios em branco" do

      device = Device.new
      expect(device).to be_invalid
      
    end
    
  end

end
