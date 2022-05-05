require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Teste de preenchimento dos campos do model User" do
    
    it "User valido com nome preenchido" do
      user = User.new
      expect(user.name).to eq("José")
    end
  
    it "User valido com email preenchido" do
      user = User.new
      expect(user.email).to eq("jose@gmail.com")  
    end
  
    it "User valido com password preenchido" do 
      user = User.new
      expect(user.email).to eq("123")  
    end
  
    it "User valido com category preenchido" do
      user = User.new
      expect(user.category).to eq("admin")  
    end

  end
  
end
