class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # @landmark.figure = Figure.find_or_create_by(name: params[:landmark][:figure])
    # @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
  get "/landmarks/new" do 
    erb :"landmarks/new"
  end
  
  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end
  
  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end
  
  patch "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @landmark.figure = Figure.find_or_create_by(name: params[:landmark][:figure])
    @landmark.save 
    redirect "/landmarks/#{@landmark.id}"
  end
end
