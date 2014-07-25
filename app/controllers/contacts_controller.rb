class ContactsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
  before_action :require_signin!
  before_action :set_contact,       only: [:show, :update, :destroy]
  before_action :authorize_contact, only: [:create, :update, :destroy]
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

    if @contact.save
      flash[:notice] = 'Contact created'
      redirect_to @contact
    else
      flash[:alert] = 'Contact not created'
      render :new
    end
  end

  def update
    if @contact.update_attributes(contact_params)
      flash[:notice] = 'Contact updated'
      redirect_to @contact
    else
      flash[:alert] = 'Contact not updated'
      redirect_to @contact
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = 'Contact deleted'
    redirect_to @contact
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def authorize_contact
      authorize @contact
    end

    def contact_params
      params.require(:contact).permit( :first_name, :last_name, :company, :notes,

        emails_attributes: [:id, :address],          

        phone_attributes: [:id, :mobile, :office, :fax, :home, :toll],

        social_media_attributes: [:id, :skype, :google_plus, :github,:linkedin,
                                  :twitter, :facebook, :coderwall])
    end
end
