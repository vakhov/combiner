class User
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :login, String
  property :pwd,   String

  has n, :items

  def self.auth( info )
    User.first(:login => info[:login], :pwd => info[:pwd])
  end

end


class Item
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :user_id, Integer
  property :name, Text
  property :url, String

  has n, :links
  has n, :tags, :through => :links

  belongs_to :user

end


class Link
  include DataMapper::Resource

  property :id,         Serial

  belongs_to :item
  belongs_to :tag
end


class Tag
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String

  has n, :links
  has n, :items, :through => :links
end


conn_string = $config["main"]["db"]

DataMapper.setup(:default, conn_string)
DataMapper.finalize
DataMapper::auto_upgrade!

if User.count == 0
  User.create(:login=>'admin', :pwd=>'admin')
end