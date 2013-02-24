get '/items' do
  @items = Item.all
  @tags = Tag.all
  haml :'items/list'
end

post '/items/add' do
  item = Item.new
  item.name = params[:tagline]
  item.url = params[:url]
  item.user_id = @cur_user.id
  item.save

  tags = params[:tags]
  tags = tags.split.uniq

  tags.each do |t|
    find_tag = Tag.first(name: t)
    if find_tag
      item.tags << find_tag
      item.tags.save
    else
      item.tags.new(name: t).save
    end
    item.save
  end

  redirect '/items'
end