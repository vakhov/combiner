require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if File.exists?('c:/')

require 'haml'

require 'dm-core'
require 'dm-migrations'

require 'include/load_config'
require 'include/models'
require 'include/helpers'
#require 'include/config_session'


enable :sessions

before do
  if session[:user_id].nil? && !['/login', '/'].include?(request.path_info)
    redirect '/'
  end

  if session[:user_id]
    @cur_user = User.get(session[:user_id])
  end
end


get '/' do
  haml :'_main'
end

require 'controllers/login'
require 'controllers/items'