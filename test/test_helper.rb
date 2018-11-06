require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
Dir["./lib/*.rb"].each do |file|
  if file != "./lib/encrypt.rb" && file != "./lib/decrypt.rb"
    require file
  end
end
