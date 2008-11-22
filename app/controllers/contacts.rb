class Contacts < Application
  before :ensure_authenticated
  
  def index
    @contacts = current_user.contacts.sorted
    display @contacts
  end
  
  def new
    @contact = Contact.new
    display @contact
  end
  
  def create(contact)
    @contact = current_user.contacts.build(contact)
    
    if @contact.save
      message[:notice] = "A new contact has been added!"
      redirect url(:contacts), :message => message
    else
      render :new
    end
  end
  
  def edit(id)
    @contact = current_user.contacts.get(id)
    raise NotFound unless @contact
    
    display @contact
  end
  
  def update(id, contact)
    @contact = current_user.contacts.get(id)
    raise NotFound unless @contact
    
    if @contact.update_attributes(contact)
      message[:notice] = "The contact has been updated!"
      redirect url(:contacts), :message => message
    else
      render :edit
    end
  end
  
  def destroy(id)
    @contact = current_user.contacts.get(id)
    raise NotFound unless @contact
    
    if @contact.destroy
      message[:notice] = "The contact has been removed"
      redirect url(:contacts), :message => message
    else
      raise InternalServerError
    end
  end
end
