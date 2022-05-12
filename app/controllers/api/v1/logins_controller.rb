class Api::V1::LoginsController < ApplicationController

  def create
    
    # define chave JWT
    hmac_secret = '123'
    
    
    #************descomentar após povoar banco*******************
    # prepara payload com dados vindos do frontend
    # payload = {email: params[:email]}, {password: params[:password]}
    
    
    #************comentar após povoar banco*******************
    payload = {email: 'admin@admin.com'}, {password: '123'} # descomentando, sempre autentica ;)
    
    # cria token
    token = JWT.encode payload, hmac_secret, 'HS256'
    
    
    #************comentar após povoar banco*******************
    render json: {token: token, status: response.status, message: "Login realizado com sucesso!"}
    
    #************descomentar após povoar banco*******************
    # pesquisa se email vindo do frontend existe no banco de dados
    # @user = User.find_by(email: params[:email])
    
    
    #************descomentar após povoar banco*******************
    # só renderiza token se o usuário estiver cadastrado no banco de dados
    # if(@user != nil)
      
    #   if(@user.email == params[:email] and @user.password == params[:password])
    #     render json: {categoria: @user.category, token: token}
    #     render json: {status: response.status_code, message: "Login realizado com sucesso!"}
    #   else
    #     render json: {status: response.status_code, message: "Não foi possível fazer o login!"}
    #   end
    
    # end

  end

end