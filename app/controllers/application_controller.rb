require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  get '/recipes' do
    # binding.pry
    @recipes = Recipe.all
    erb :recipes
  end

  post '/recipes' do
    new_recipe = Recipe.create(params)
    @recipes = Recipe.all
    redirect to ("/recipes/#{new_recipe.id}")
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @single_recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @single_recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @single_recipe = Recipe.find(params[:id])
    @single_recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    erb :show
  end

  delete '/recipes/:id/delete' do
  @single_recipe = Recipe.delete(params[:id])

  erb :delete
  end

end
