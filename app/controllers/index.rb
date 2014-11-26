require_relative "../models/category"


get '/posts/:id' do
  @item = Post.find(params[:id])
  erb :single_post
end

post '/posts' do
  item = Post.find(params[:id])
  cat = Category.where(name: params[:category]).first

  item.title = params[:title]
  item.email = params[:email]
  item.description = params[:description]
  item.price = params[:price]
  item.category_id = cat.id
  item.save

  redirect to('/categories/' << Category.where(name: params[:category]).first.id.to_s)
end

get '/categories' do
  @categories = Category.all
  erb :category
end

post '/categories' do
  redirect to('/categories/' << Category.where(name: params[:category]).first.id.to_s)
end

get '/categories/:id' do
  category = Category.where(id: params[:id]).first
  @posts = category.posts
  erb :post
end

post '/' do
  @items = Post.where(category_id: Category.where(name: params[:category]).first.id)
  erb :index
end

get '/' do
  @items = []
  erb :index
end

get '/createpost' do
  erb :new_posting
end

post '/createpost' do
  Post.create(title: params[:title], description: params[:description], email: params[:email], price: params[:price], category: Category.where(name: params[:category]).first)
  redirect to('/posts?category=' << params[:category])
end
