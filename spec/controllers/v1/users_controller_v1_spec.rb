require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  before{ @user = User.create(id:1,name:"Jose",email:"jose@gmail.com",password:"123",category:"admin")}

  describe "GET /api/v1/users" do
  
    it "Consegue listar todos os usuarios e retorna status 200" do

      get :index
      expect(JSON.parse(response.body).size).to eq(1)

    end
    
  end

end