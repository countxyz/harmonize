class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact  = Contact.find(params[:id])
    @phone = @contact.phone
  end

  def new
    @contact = Contact.new
    @contact.build_phone
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact has been created"
      redirect_to @contact
    else
      flash[:alert] = "Contact has not been created"
      render :action => "new"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      flash[:notice] = "Contact has been updated"
      redirect_to @contact
    else
      flash[:alert] = "Contact has not been updated"
      render :action => "edit"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Contact has been deleted"
    redirect_to contacts_path
  end

  private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :company, :email,
        :secondary_email, :notes,
          phone_attributes: [:id, :mobile, :office, :fax, :home])
    end
end
