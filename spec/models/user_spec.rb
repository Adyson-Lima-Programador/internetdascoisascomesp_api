require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = User.new }
  
  describe "Teste de preenchimento dos campos do model User" do
    
    it "name preenchido" do
      @user.name = "José"
      expect(@user.name).to eq("José")
    end
  
    it "email preenchido" do
      @user.email = "jose@gmail.com"
      expect(@user.email).to eq("jose@gmail.com")  
    end
  
    it "password preenchido" do 
      @user.password = "123"
      expect(@user.password).to eq("123")  
    end
  
    it "category preenchido" do
      @user.category = "admin"
      expect(@user.category).to eq("admin")  
    end

  end

  describe "Teste de validação do model User de acordo com documentação" do
    
    it "User valido com campos obrigatorios preenchidos" do

      @user.name = "José"
      @user.email = "jose@gmail.com"
      @user.password = "123"
      @user.category = "admin"
      expect(@user).to be_valid
      
    end

    it "User invalido com campos obrigatorios em branco" do

      user = User.new
      expect(user).to be_invalid
      
    end

  end
  
end
