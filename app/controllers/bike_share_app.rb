class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

  get '/stations/new' do
    @station = Station.all
    @city = City.all
    erb :"stations/new"
  end

  get '/stations/:id' do
    @all_stations = Station.all
    @station = Station.find(params[:id])
    @city = City.all
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @city = City.all
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  post '/stations' do
    if params[:station][:name] == "" || params[:station][:dock_count] == 0
      @fields = params[:station].select {|key, value| key if value == ""}
      erb :"stations/error"
    else
      @station = Station.create(params[:station])
      redirect "/stations/#{@station.id}"
    end
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

end
