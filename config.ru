$:.unshift File.expand_path('.')

require 'app'

use Rack::ShowExceptions

run App.new