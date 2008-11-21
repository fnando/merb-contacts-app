class Contacts < Application
  def index
    render
  end
  
  def new
    @contact = Contact.new
    display @contact
  end
end
