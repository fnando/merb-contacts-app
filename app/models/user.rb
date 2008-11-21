class User
  include DataMapper::Resource
  
  property :id,     Serial
  property :login,  String
  
  validates_is_unique :login
  validates_length :login, :within => 3..30
  validates_length :password, :min => 4, :if => :password_required?
  
  has n, :contacts
end
