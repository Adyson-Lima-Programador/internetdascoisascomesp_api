require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Teste de preenchimento dos campos do model User" do
    
    it "User valido com nome preenchido" do
      user = User.new
      user.name = "José"
      expect(user.name).to eq("José")
    end
  
    it "User valido com email preenchido" do
      user = User.new
      user.email = "jose@gmail.com"
      expect(user.email).to eq("jose@gmail.com")  
    end
  
    it "User valido com password preenchido" do 
      user = User.new
      user.password = "123"
      expect(user.password).to eq("123")  
    end
  
    it "User valido com category preenchido" do
      user = User.new
      user.category = "admin"
      expect(user.category).to eq("admin")  
    end

  end
  
end
