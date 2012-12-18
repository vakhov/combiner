get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/login' do
  haml :'login/login'
end

post '/login' do
  user = User.auth(:login => params[:login], :pwd => params[:pwd])
  session[:user_id] = user.id if user
  redirect '/items'
end