class FiguresController < ApplicationController
  # add controller methods
  
  get '/figures' do 
    @figures = Figure.all
    erb :"figures/index"
  end

  post "/figures" do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    redirect "/figures/#{@figure.id}"
  end
  
  get "/figures/new" do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end
  
  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end
  
  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end
  
  patch "/figures/:id" do
    
  end
  
end
