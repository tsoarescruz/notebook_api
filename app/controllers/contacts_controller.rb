class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  #Este root true insere o cabecalho ou root em cada no do json
  #Insere informacoes a mais, podendo deixar o json mais pesado

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts
  end


  #Utilizando o map para fazer merge do atributo author Jackson para cada no do json
  #Esta abordagem insere esse atributo para cada no e indicado quando se quer fazer
  #merge de atributos de outro objeto e montar o json

  # GET /contacts
  # def index
  #   @contacts = Contact.all
  #
  #   render json: @contacts.map {|contact| contact.attributes.merge({author: "Jackson"}) }
  # end

  # GET /contacts/1
  def show
    render json: @contact, root:true
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate)
    end
end
