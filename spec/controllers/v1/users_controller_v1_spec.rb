require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  before{ @user = User.create(name:"Jose",email:"jose@gmail.com",password:"123",category:"admin")}

  describe "GET /api/v1/users" do
  
    it "Consegue listar todos os usuarios e retorna status 200" do

      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)

    end
  
  end

  describe "GET /api/v1/users/{id}" do
    
    it "Consegue listar um usuario especifico e retorna status 200" do

      get :show, params: {id: @user.id}
      expect(response.body).to include_json(id: @user.id)
      expect(response).to have_http_status(200)
      
    end

  end

  describe "POST /api/v1/users" do

    it "Consegue criar um usuario e retorna status 201" do

      post :create, params: {user: {name: @user.name, email: @user.email, password: @user.password, category: @user.category  }, format: :json }
      expect(response.body).to include_json(name: @user.name, email: @user.email, password: @user.password, category: @user.category)
      
    end

  end
    
end