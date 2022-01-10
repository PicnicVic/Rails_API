class JwtServices
  # Can be automatically loaded into other files
  @secret = Rails.application.credentials.dig(:secret_key_base)

  def self.encode(user)
    # Takes a user, passing that user, creating token and returning it
    payload = {user_id: user.id, exp: 1.hour.from_now.to_i}
    token = JWT.encode(payload, @secret)
  end
 
  def self.decode(token)
    begin
      payload = JWT.decode(token, @secret, true)
       npayload[0]
    rescue Exception=> e
      pp e
      nil
    end 
  end
end
