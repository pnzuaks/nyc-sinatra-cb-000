class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :"landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(:id => params["id"])
    puts @landmark
    erb :"landmarks/edit"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by(:id => params["id"])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(:id => params["id"])
    erb :"landmarks/show"
  end

end
