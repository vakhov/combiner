get '/items' do
  @items = Item.all
  haml :'items/list'
end

post '/items/add' do
  item = Item.new
  item.name = params[:name]
  item.user_id = @cur_user.id
  item.save
  redirect '/items'
end