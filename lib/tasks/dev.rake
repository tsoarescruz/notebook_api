namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando o tipos de contatos"

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Kinds cadastrados com sucesso"

    puts "Cadastrando os contatos"
    100.times do |i|
      Contact.create!(
        name:Faker::Name.name,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(35.years.ago, 18.years.ago),
        kind:Kind.all.sample
      )

    end
    puts "Contatos cadastrados com sucesso"
  end
end
