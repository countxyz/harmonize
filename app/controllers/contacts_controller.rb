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
      flash[:notice] = "Contact has been created."
      redirect_to @contact
    else
      flash[:alert] = "Contact has not been created."
      render :action => "new"
    end
  end

  def edit
  end

  private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email,
          :secondary_email, :notes,
           phone_attributes: [:id, :mobile, :office, :fax, :home])
    end
end
