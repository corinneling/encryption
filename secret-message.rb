require 'openssl'
require 'digest'

# encrypt a message
cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.encrypt

puts "select your password:"
pass = gets.chomp
key = Digest::SHA256.digest("#{pass}")

iv = cipher.random_iv

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
