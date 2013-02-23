require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if File.exists?('c:/')

require 'haml'

require 'dm-core'
require 'dm-migrations'

require File.join(File.dirname( __FILE__ ),'include/load_config')
require File.join(File.dirname( __FILE__ ),'include/models')
require File.join(File.dirname( __FILE__ ),'include/helpers')
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

require File.join(File.dirname( __FILE__ ),'controllers/login')
require File.join(File.dirname( __FILE__ ),'controllers/items')