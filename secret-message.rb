require 'openssl'
require 'digest'
require 'securerandom'
require 'base64'

# encrypt a message
cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.encrypt

puts "select your password:"
@pass = gets.chomp

# create a secure password
salt = SecureRandom.base64(20)
secure = OpenSSL::PKCS5.pbkdf2_hmac_sha1(@pass, salt, 2000, cipher.key_len+cipher.iv_len)
key = secure[0, cipher.key_len]
iv = secure[cipher.key_len, cipher.iv_len]

cipher.key = key
cipher.iv = iv

puts "create your message:"
message = gets.chomp
encrypted = cipher.update("#{message}")
encrypted << cipher.final
puts "encrypted: #{encrypted}"

# decrypt it
cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.decrypt
cipher.key = key
cipher.iv = iv

decrypted = cipher.update(encrypted)
decrypted << cipher.final
puts "decrypted: #{decrypted}"
