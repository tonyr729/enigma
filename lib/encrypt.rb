require './lib/enigma'
require './lib/encryption'
require './lib/decryption'
require './lib/cypher'

enigma = Enigma.new

message_file = File.open("lib/#{ARGV.first}", "r")
message = message_file.read.chomp

encrypted_message = enigma.encrypt(message)

encryption_file = File.open("lib/#{ARGV.last}", "w")
encryption_file.write(encrypted_message[:encryption])
encryption_file.close
puts "Created '#{ARGV.last}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
