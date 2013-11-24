class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(project_params)
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

  def project_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end
end
