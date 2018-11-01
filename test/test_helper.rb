require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
Dir["./lib/*.rb"].each {|file| require file }
