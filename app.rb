require 'compass'

require 'sinatra/base'
require 'mustache/sinatra'

class App < Sinatra::Base
  register Mustache::Sinatra

  require 'views/layout'

  set :mustache, {
    :views     => 'views/',
    :templates => 'templates/'
  }

  Compass.configuration do |config|
    Compass.add_project_configuration(File.join('compass.config'))
  end

  set :sass, Compass.sass_engine_options

  get '/' do
    @title = "Mustache + Sinatra = Wonder"
    mustache :index
  end

  get '/other' do
    mustache :other
  end

  get '/nolayout' do
    content_type 'text/plain'
    mustache :nolayout, :layout => false
  end

  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass(:"sass/#{params[:name]}", Compass.sass_engine_options )
  end
end
