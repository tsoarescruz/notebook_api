class Phone < ApplicationRecord
  # Removido o optional true durante o exercicios, pode cadastrar o telefone depois 
  belongs_to :contact
  #, optional: true

end
