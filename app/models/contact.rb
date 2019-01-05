class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Jackson Pires"
  end

  #Metodo que faz o overide para o render json
  #Forma mais facil de deixar padronizado o retorno do json para um objeto

  def as_json(options={})
    super(methods: :author, root:true)
  end
send
