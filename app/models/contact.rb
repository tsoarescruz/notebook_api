class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

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

  def to_br
    {
      name:self.name,
      emai: self.email,
      birthdate: self.birthdate_br
    }
  end
end
