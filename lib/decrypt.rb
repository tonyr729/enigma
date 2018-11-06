require './lib/enigma'
require './lib/encryption'
require './lib/decryption'
require './lib/cypher'

enigma = Enigma.new

encrypted_file = File.open("lib/#{ARGV[0]}", "r")
message = encrypted_file.read.chomp

if ARGV[3]
  decrypted_message = enigma.decrypt(message, ARGV[2], ARGV[3].dup)
else
  decrypted_message = enigma.decrypt(message, ARGV[2])
end

decrypted_file = File.open("lib/#{ARGV[1]}", "w")
decrypted_file.write(decrypted_message[:decryption])
decrypted_file.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
