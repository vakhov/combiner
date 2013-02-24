helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def tags(obj)
    current_tags = Array.new
    obj.tags.each do |tag|
      current_tags << tag.name
    end
    current_tags.join(' ')
  end
end
