class ApplicationController < ActionController::API
  
  # Configuração para rspec
  include ActionController::HttpAuthentication::Token::ControllerMethods

end
