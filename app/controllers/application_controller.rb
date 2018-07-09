class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params)
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(params)
    erb :edit
  end

  patch '/recipe/:id' do
    params.delete("_method")
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(params)
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

end
