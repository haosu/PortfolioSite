require 'compass'

require 'sinatra/base'
require 'sinatra/synchrony'
require 'mustache/sinatra'

class App < Sinatra::Base
  register Sinatra::Synchrony
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
    mustache :index
  end

  get '/resume' do
    mustache :resume
  end

  get '/blog' do
    mustache :blog
  end

  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass(:"sass/#{params[:name]}", Compass.sass_engine_options )
  end


end
