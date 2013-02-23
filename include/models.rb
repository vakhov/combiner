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
  property :tags, String

  has n, :tags

  belongs_to :user
end

class Tag
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String

  belongs_to :item
end

conn_string = $config["main"]["db"]

DataMapper.setup(:default, conn_string)
DataMapper.finalize
DataMapper::auto_upgrade!

if User.count == 0
  User.create(:login=>'admin', :pwd=>'admin')
end