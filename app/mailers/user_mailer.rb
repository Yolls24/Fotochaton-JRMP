class UserMailer < ApplicationMailer
  default from: "contact@localhost" # tu peux changer l'adresse si besoin

  # Méthode pour le mail de bienvenue
  def welcome_email(user)
    @user = user
    @url  = root_url
    mail(to: @user.email, subject: "Bienvenue chez Fotochatons !")
  end
end


  
  
  

