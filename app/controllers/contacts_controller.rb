class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
    @phone, @social_media = @contact.phone, @contact.social_media
  end

  def new
    @contact = Contact.new
    @contact.build_phone
    @contact.build_social_media
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = 'Contact has been created'
      redirect_to @contact
    else
      flash[:error] = 'Contact has not been created'
      render :action => 'new'
    end
  end

  def update
    if @contact.update_attributes(contact_params)
      flash[:notice] = 'Contact has been updated'
      redirect_to @contact
    else
      flash[:alert] = 'Contact has not been updated'
      render :action => 'edit'
    end
  end

  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to @contact }
      format.js { head :no_content }
    end
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit( 
        :first_name, :last_name, :company, :email, :secondary_email, :notes,
          phone_attributes: [:id, :mobile, :office, :fax, :home],
          social_media_attributes: [:id, :skype, :google_plus, :github,
            :linkedin, :twitter, :facebook, :coderwall])
    end
end
