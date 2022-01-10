class ApplicationController < ActionController::API
  # We will need this repeated functionlaity
  def authenticate
      token = extract_token_from_auth_headers
      payload = JwtServices.decode(token)

      if payload
        @current_user ||= User.find(payload["user_id"])
      else
        render json: {error: "You must be logged in to do that"}, status: 401
      end
      
  end

  def current_user 
    @current_user
  end

  def logged_in?
    !!@current_user
  end

  def extract_token_from_auth_headers
    request.headers["Authorization"] && request.headers["Authorization"].split(" ")[1]
  end
end
# before_action :authorized

#   def encode_token(payload)
#     JWT.encode(payload, 'yourSecret')
#   end

#   def auth_header
#     # { Authorization: 'Bearer <token>' }
#     request.headers['Authorization']
#   end

#   def decoded_token
#     if auth_header
#       token = auth_header.split(' ')[1]
#       # header: { 'Authorization': 'Bearer <token>' }
#       begin
#         JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
#       rescue JWT::DecodeError
#         nil
#       end
#     end
#   end

#   def logged_in_user
#     if decoded_token
#       user_id = decoded_token[0]['user_id']
#       @user = User.find_by(id: user_id)
#     end
#   end

#   def logged_in?
#     !!logged_in_user
#   end

#   def authorized
#     render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
#   end
# end
