class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ send_mail show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contact = Contact.new
    render :new
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    if params[:id].present?
      set_contact
    else
      @contact = Contact.new
    end
  end

  def send_mail
    NoticeMailer.sendmail_contact(@contact).deliver #追記
    redirect_to root_url, notice: "お問い合わせが完了しました！"
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :category, :content)
    end
end
