require 'openssl'
require 'digest'

# encrypt a message
cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.encrypt

key = cipher.random_key
iv = cipher.random_iv

cipher.key = key
cipher.iv = iv

puts "create your message:"
message = gets.chomp
encrypted = cipher.update("#{message}") + cipher.final
puts "encrypted: #{encrypted}"

# decrypt it
cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.decrypt
cipher.key = key
cipher.iv = iv

decrypted = cipher.update(encrypted)
decrypted << cipher.final
puts "decrypted: #{decrypted}"
