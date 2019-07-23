class Contact < ApplicationRecord
  # O Belongs_to o id do kind fica do lado dos contatos 
  belongs_to :kind
  # O Optional true faz com que durante o cadastro, esse parametro nao seja obrigatorio
  # para cria o objeto
  # , optional:true
  # Has_many o id do contato fica gravado no telefone
  # Os contatos possuiem muitos telefones
  has_many :phones
  
  # Não preciso ter os telefones criados previamente
  #Posso fazer a referencia, posso cadastrar junto.

  accepts_nested_attributes_for :phones



  # Método para fazer o parceamento da data utilizando a data
  # birthdate_br com o i18n parceada com as "/"

  def as_json(options={})
    h = super(options)
    h[:birthdate] = birthdate_br
    h
  end

  # def author
  #   "Jackson Pires"
  # end
  #
  #
  # def kind_description
  #   self.kind.description
  # end
  #
  # #Metodo que faz o overide para o render json
  # #Forma mais facil de deixar padronizado o retorno do json para um objeto
  #
  # def as_json(options={})
  #   super(
  #     # Esse tipo de chamada de metodo para o kind_description e complementar ao
  #     #include, se nao quiser que ele apareca como nested do kind e sim common
  #     #um atributo para o no principal
  #
  #     # methods: [:author, :kind_description]
  #     methods: [:author],
  #     root:true,
  #     #Utilizando o only para trazer somente os atributes que se quer
  #     # include: { kind: { only: :description }}
  #     include: :kind
  #   )
  # end

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  #Comentado para poder fazer o metodo birthdate_br para o render_to_json

  #def to_br
  #  {
  #    name:self.name,
  #    emai: self.email,
  #    birthdate: self.birthdate_br
  #  }
  #end
end
