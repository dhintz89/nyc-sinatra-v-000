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
    # params[:figure][:title_ids].each {|title_id| @figure.titles << Title.find_or_create_by(id: title_id)}
    # params[:figure][:landmark_ids].each {|landmark_id| @figure.landmarks << Landmark.find_or_create_by(id: landmark_id)}
    # @figure.save
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
  
end
