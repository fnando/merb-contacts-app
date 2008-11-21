class Contact
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String, :nullable => false
  property :company, String
  property :email, String, :format => :email_address
  property :phone, String
  property :mobile, String
  property :address, String
  
  belongs_to :user
end
