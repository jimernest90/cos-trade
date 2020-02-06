class ApplicationController < ActionController::API
    # def authenticate_token
    #     puts "AUTHENTICATE JWT"
    #     render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
    # end

    # def bearer_token
    #     puts "BEARER TOKEN"
    #     puts header = request.env["HTTP_AUTHORIZATION"]
        
    #     pattern = /^Bearer /
    #     puts "TOKEN WITHOUT BEARER"
    #     puts header.gsub(pattern, '') if header && header.match(pattern)
    #     header.gsub(pattern, '') if header && header.match(pattern)
    # end

    #  def decode_token(token_input)
    #     puts "DECODE TOKEN, token input: #{token_input}"
    #     token = JWT.decode(token_input, ENV["JWT_SECRET"], true,)
    #     JWT.decode(token_input, ENV['JWT_SECRET'], true)
    #     render json: {decoded:token}
    #  rescue 
    #     render json: {status: 401, message: 'this is not working'}
    #  end
  def authenticate_token                                                           
    render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
  end                                                                              
                                                                                   
  def bearer_token                                                                 
    header = request.env['HTTP_AUTHORIZATION']                                     
    pattern = /^Bearer /                                                           
    header.gsub(pattern, '') if header && header.match(pattern)                    
  end                                                                              
                                                                                   
  def decode_token(token_input)                                                    
    JWT.decode(token_input, ENV['JWT_SECRET'], true)                                           
  rescue                                                                           
    render json: { status: 401, message: 'Unauthorized' }                          
  end
     def get_current_user                                                           
        return if !bearer_token                                                      
        decoded_jwt = decode_token(bearer_token)                                     
        User.find(decoded_jwt[0]["user"]["id"])                                                     
      end

end