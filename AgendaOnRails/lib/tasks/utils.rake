namespace :utils do
  desc "Método criado para popular o banco com dados para teste"
  task seed: :environment do
    
    # Cria 10 contatos aleatórios
    100.times do |i|
      Contact.create!(name: Faker::Name.name, email: Faker::Internet.free_email, kind: Kind.all.sample, rmk: LeroleroGenerator.sentence([1,2,3].sample))
    end
    puts "Contatos importados!"
    
    # Para cada contato criado, cria um endereço
    Contact.all.each do |contact|
      Address.create!(street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, contact: contact)
    end
    puts "Endereços importados!"
    
    # Para cada contato, cria de 1 a 3 telefones
    Contact.all.each do |contact|
      Random.rand(1..3).times do |i|
        Phone.create!(phone: Faker::PhoneNumber.cell_phone, contact: contact)
      end
    end
    puts "Telefones importados!"
    
  end

end
