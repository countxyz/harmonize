class ContactsController < ApplicationController
  before_action :require_signin!
  before_action :set_contact,       only: [:show, :update, :destroy]
  after_action  :verify_authorized, only: [:create, :update, :destroy]

  def index
    @contacts = Contact.all
    pdf = ContactListPdf.new(@contacts)

    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv }
      format.pdf do
        send_data pdf.render, filename: 'contacts.pdf', type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    authorize @contact

    if @contact.save
      flash[:notice] = 'Contact created'
      redirect_to @contact
    else
      flash[:alert] = 'Contact not created'
      render :new
    end
  end

  def update
    authorize @contact
    if @contact.update_attributes(contact_params)
      flash[:notice] = 'Contact updated'
      redirect_to @contact
    else
      flash[:alert] = 'Contact not updated'
      redirect_to @contact
    end
  end

  def destroy
    authorize @contact
    @contact.destroy
    flash[:notice] = 'Contact deleted'
    redirect_to @contact
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit( :first_name, :last_name, :company, :notes,

        emails_attributes: [:id, :address],          

        phone_attributes: [:id, :mobile, :office, :fax, :home, :toll],

        social_media_attributes: [:id, :skype, :google_plus, :github,:linkedin,
                                  :twitter, :facebook, :coderwall])
    end
end
