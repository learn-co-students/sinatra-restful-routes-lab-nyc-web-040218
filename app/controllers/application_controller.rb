require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  post '/recipes' do
    ne = Recipe.create(params)
    @recipes = Recipe.all
    redirect to("/recipes/#{ne.id}")
    erb :show
  end
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update("name" => params[:name], "ingredients" => params[:ingredients], "cook_time" => params[:cook_time])
    @recipes = Recipe.all
    erb :show
  end
  get '/recipes/new' do
    erb :new
  end
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    erb :delete
  end
end
