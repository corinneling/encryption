require 'base64'

puts "create a message"
string = gets.chomp
enc = Base64.encode64(string)
puts "encoded: #{enc}"
dec = Base64.decode64(enc)
puts "decoded: #{dec}"
