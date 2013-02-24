get '/tag/:tag' do
  @items = Tag.first(name: params[:tag])
  if @items
    @items = @items.items
    haml :'items/tag'
  else
    'nonexistent tag'
  end
end