cat1 = Category.find_or_create_by!(name: "IMPRESSION") do |c|
  c.description = "Des photos d'adorables chatons, imprimées en 60 x 60cm, pour illuminer votre intérieur 🐱✨"
  c.image = "chaton_kawaii_1.jpg"
end

cat2 = Category.find_or_create_by!(name: "TELECHARGEMENT") do |c|
  c.description = "Des clichés originaux dignes d’une galerie d’art que vous pouvez télecharger directement depuis chez vous 🎨"
  c.image = "chaton_humoristique_1.jpg"
end

# Items pour la catégorie IMPRESSION
Item.find_or_create_by!(name: "Chaton noir aux yeux bleus") do |item|
  item.description = "Un petit chaton noir avec de magnifiques yeux bleus."
  item.price = 9.99
  item.image = "chaton_noir.jpg"
  item.category = cat1
end

Item.find_or_create_by!(name: "Chaton tigré endormi") do |item|
  item.description = "Un adorable chaton tigré qui dort paisiblement."
  item.price = 12.50
  item.image = "chaton_tigre.jpg"
  item.category = cat1
end

# Items pour la catégorie TELECHARGEMENT
Item.find_or_create_by!(name: "Chaton aquarelle") do |item|
  item.description = "Une photo de chaton traitée comme une peinture aquarelle."
  item.price = 15.00
  item.image = "chaton_aquarelle.jpg"
  item.category = cat2
end

Item.find_or_create_by!(name: "Chaton fleurs") do |item|
  item.description = "Une photo de chaton traitée comme une peinture aquarelle."
  item.price = 15.00
  item.image = "chaton_2.jpg"
  item.category = cat2
end
