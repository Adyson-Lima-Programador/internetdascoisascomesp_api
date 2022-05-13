require 'faker'

puts 'Gerando usuários... <categoria 1 = admin, categoria 2 = user >'
User.create! email: 'admin@admin.com', name: 'admin', password: "123", category: '1'
User.create! email: 'user@user.com', name: 'user', password: "123", category: '2'
28.times do |i|
  User.create! name: Faker::Name.name.downcase, email: Faker::Name.first_name.downcase+"@gmail.com", password: "123", category: ["1","2"].sample
end
puts 'Usuários gerados com sucesso!'