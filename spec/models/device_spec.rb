require 'rails_helper'

RSpec.describe Device, type: :model do

  before { @device = Device.new }
  
  describe "Teste de preenchimento dos campos do model Device" do
    
    it "name preenchido" do
      
      expect(@device.name).to eq("Controle de luz")
    end

    it "description preenchido" do
      
      expect(@device.name).to eq("Controle de luzes da casa")
    end

    it "user_id preenchido" do
      
      expect(@device.name).to eq(1)
    end

    it "status preenchido" do
      
      expect(@device.name).to eq(0)
    end

    it "request_count preenchido" do
      
      expect(@device.name).to eq(1200)
    end

    it "category preenchido" do
      
      expect(@device.name).to eq("send")
    end

  end

end
