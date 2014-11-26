categories = ["Electronics","Jobs","Automotive"]

categories.each do |category|
  Category.create(name: category) if Category.where(name: category).empty?
end





names = ["MacBook 2008","Apple Trackpad","Silicon Valley intern","Lawyer trainee","BMW 320i E90 2010","Cheryll's Proton Persona 2010"]

respective_categories = ["Electronics","Electronics","Jobs","Jobs","Automotive","Automotive"]

descriptions = ["macbook macbook macbook macbook macbook","trackpad trackpad trackpad trackpad trackpad","intern intern intern intern intern","lawyer lawyer lawyer lawyer lawyer","320i 320i 320i 320i 320i","Persona Persona Persona Persona Persona"]

emails = ["mac@ownner.com","apple@trackpad.com","intern@sv.com","trainee@lawyer.com","320@bmw.com","cheryll@proton.com"]

prices = [2000,150.50,300,1500,135000,30000]

i=0
names.each do |name_of_item|
  if Post.where(title: name_of_item).empty?
    Post.create(title: name_of_item, description: descriptions[i], price: prices[i], email: emails[i], category: Category.where(name: respective_categories[i]).first)
  end
  i += 1
end