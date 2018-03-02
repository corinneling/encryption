require 'openssl'
require 'digest'
require 'securerandom'
require 'base64'

def create_password
  puts "select your password:"
    @pass = gets.chomp
  puts "please verify your password"
    pass2 = gets.chomp
  if @pass === pass2
    create_secure_password
  else
    puts "Your passwords did not match. Please try again"
    create_password
  end
end


# create a secure password
def create_secure_password
  valid_pass = Digest::SHA256.digest(@pass)
  salt = SecureRandom.base64(20)
  keylength = 24
  @secure = OpenSSL::PKCS5.pbkdf2_hmac_sha1(valid_pass, salt, 2000, keylength)
  puts "Thank you for setting up your password. We have successfully encrypted it."
  puts "encrypted password: #{@secure}"
end

create_password
