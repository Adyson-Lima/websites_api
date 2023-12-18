puts 'gerando websites...'

5.times do |i|
  Website.create(url: ["upwork.com", "google.com", "workana.com"].sample,
   description: 'um website famoso')
end

puts 'websites gerados com sucesso!'