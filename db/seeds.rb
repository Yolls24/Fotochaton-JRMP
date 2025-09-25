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
# db/seeds.rb
puts "Cleaning DB..."
User.destroy_all
Product.destroy_all
Cart.destroy_all

puts "Creating users..."
user = User.create!(email: "alice@foto.com", password: "password", name: "Alice")
user2 = User.create!(email: "bob@foto.com", password: "password", name: "Bob")

puts "Creating products..."
p1 = Product.create!(title: "Chaton gris", description: "Photo mignonne 30x30", price_cents: 1500)
p2 = Product.create!(title: "Chaton tigré", description: "Belle pose", price_cents: 2000)

# Attach sample images (si tu as public/images seed assets)
if Rails.root.join("db/seeds_images").exist?
  p1.image.attach(io: File.open(Rails.root.join("db/seeds_images/cat1.jpg")), filename: "cat1.jpg")
  p2.image.attach(io: File.open(Rails.root.join("db/seeds_images/cat2.jpg")), filename: "cat2.jpg")
end

puts "Seeding done."
