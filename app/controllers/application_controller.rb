class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  # create new recipe
  get '/recipes/new' do 
    erb :new
  end

  #index page
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  #show page
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #edit form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  #update recipe
  patch '/recipes/:id' do  
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #create recipe
  post '/recipes' do  
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete/destroy recipe
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end


end #end of application_controller.rb

