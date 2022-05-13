class Api::V1::UsersController < ApplicationController

  before_action :set_user, only: %i[ show update destroy ]

  def index

    # Se há pedido de paginação, retorna paginação pedida
    # Aceita requisições: localhost:3000/api/v1/users?page=1&per_page=10
    if(params[:page])  
      page = (params[:page] || 1).to_i
      per_page = (params[:per_page] || 10).to_i
      @users = User.all.page(page).per(per_page)
    # Se não há pedido de paginação, retorna todos os usuarios
    else
      @users = User.all
    end
    render json: @users

  end

  def show
    
    render json: @user

  end

  def create 

    @user = User.new(user_params)
    
    if @user.save 
      
      render json: @user, status: :created, location: api_v1_user_url(@user)
    
    else
      
      render json: @user.errors, status: :internal_server_error
    
    end

  end

  def update

    if @user.update(user_params)
      
      render json: @user
    
    else
      
      render json: @user.errors, status: :internal_server_error   
    
    end

  end

  def destroy

    @user.destroy

  end

private

  def set_user
  
    @user = User.find(params[:id])

  end

  def user_params

    params.require(:user).permit(:name, :email, :password, :category)

  end

end