namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "------- Resetando o banco de dados -------"
    %x(rails db:drop db:create db:migrate) # Antes de executar, ele escreve no terminal
    puts "------- Resetando o banco de dados ------- [OK]"
    puts "Cadastrando os TIPOS de contatos..."
    
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Cadastrando os TIPOS de contatos... [OK]"

    ########################################################

    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Cadastrando os contatos... [OK]"

    puts "Cadastrando os telefones..."
    
      Contact.all.each do |contact|
        Random.rand(5).times do |i|
          phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
          contact.phones << phone
          contact.save!
        end
      end

    puts "Cadastrando os telefones... [OK]"

    puts "Cadastrando os Endereços dos contatos..."
      Contact.all.each do |contact|
        Address.create(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
        )
      end
    

    puts "Cadastrando os Endereços dos contatos... [OK]"

  end

end