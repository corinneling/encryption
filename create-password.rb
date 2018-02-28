require 'openssl'
require 'securerandom'
require 'base64'


puts "select your password:"
  pass = gets.chomp
# create a secure password
  salt = SecureRandom.base64(20)
  secure = OpenSSL::PKCS5.pbkdf2_hmac_sha1(pass, salt, 2000, 24)
puts secure
