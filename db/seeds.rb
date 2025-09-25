puts "Cleaning DB..."
User.destroy_all
Category.destroy_all
Item.destroy_all
Product.destroy_all
Cart.destroy_all

puts "Creating users..."
# Admin
admin_user = User.create!(
  email: "martine@email.com",
  password: "12345678",
  admin: true
)

# Utilisateurs normaux
user1 = User.create!(email: "alice@foto.com", password: "password", admin: false)
user2 = User.create!(email: "bob@foto.com", password: "password", admin: false)

puts "Creating categories..."
cat1 = Category.find_or_create_by!(name: "IMPRESSION") do |c|
  c.description = "Des photos d'adorables chatons, imprimées en 60 x 60cm, pour illuminer votre intérieur 🐱✨"
  c.image = "chaton_kawaii_1.jpg"
end

cat2 = Category.find_or_create_by!(name: "TELECHARGEMENT") do |c|
  c.description = "Des clichés originaux dignes d’une galerie d’art que vous pouvez télécharger directement depuis chez vous 🎨"
  c.image = "chaton_humoristique_1.jpg"
end

puts "Creating items..."
Item.find_or_create_by!(name: "Chaton noir aux yeux bleus") do |item|
  item.description = "Un petit chaton noir avec de magnifiques yeux bleus."
  item.price = 9.99
  item.image = "chaton_noir.jpg"
  item.category_id = cat1.id
end

Item.find_or_create_by!(name: "Chaton tigré endormi") do |item|
  item.description = "Un adorable chaton tigré qui dort paisiblement."
  item.price = 12.50
  item.image = "chaton_tigre.jpg"
  item.category_id = cat1.id
end

Item.find_or_create_by!(name: "Chaton aquarelle") do |item|
  item.description = "Une photo de chaton traitée comme une peinture aquarelle."
  item.price = 15.00
  item.image = "chaton_aquarelle.jpg"
  item.category_id = cat2.id
end

Item.find_or_create_by!(name: "Chaton fleurs") do |item|
  item.description = "Une photo de chaton traitée comme une peinture aquarelle."
  item.price = 15.00
  item.image = "chaton_2.jpg"
  item.category_id = cat2.id
end

puts "Creating products..."
Product.create!(name: "Chaton gris", description: "Photo mignonne 30x30", price: 15.00, image_url: "cat1.jpg")
Product.create!(name: "Chaton tigré", description: "Belle pose", price: 20.00, image_url: "cat2.jpg")

puts "Seeding done."
