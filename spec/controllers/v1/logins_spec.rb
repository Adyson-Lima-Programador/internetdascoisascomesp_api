require 'rails_helper'

RSpec.describe Api::V1::LoginsController, type: :controller do

  describe "POST /api/v1/logins" do
    
    it "Consegue acessar Controller logins" do

      post :create, params: { email: 'admin@admin.com', password: '123' }
      expect(response.body).to include_json(token: "eyJhbGciOiJIUzI1NiJ9.W3siZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSx7InBhc3N3b3JkIjoiMTIzIn1d.3Q1RPrkuT3sNoEi_e9DYhUfbRkZt81_T6TaFel_EZ3Q")
      
    end

    it "Controller retorna status 200" do
      
      post :create, params: { email: 'admin@admin.com', password: '123' }
      expect(response.status).to eq(200) 

    end

  end

end

