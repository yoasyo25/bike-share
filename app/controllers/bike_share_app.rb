class BikeShareApp < Sinatra::Base

  def files
    @stations = Station.all
    @cities = City.all
    @trips = Trip.all
    nil
  end

  get '/' do
    erb :index
  end

  get '/stations' do
    files
    erb :"/stations/index"
  end

  get '/trips' do
    files
    # @trips = Trip.all
    erb :"/trips/index"
  end

  get '/stations/stations-dashboard' do
    erb :stations_dashboard
  end

  # get '/trips/trips-dashboard' do
  #   erb :trips_dashboard
  # end

  get '/stations/new' do
    files
    erb :"stations/new"
  end

  get '/trips/new' do
    files
    erb :"trips/new"
  end

  get '/stations/:id' do
    files
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/trips/:id' do
    files
    # @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/stations/:id/edit' do
    files
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  get '/trips/:id/edit' do
    files
    # @trip = Trip.find(params[:id])
    erb :'trips/edit'
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

  # delete '/trips/:id' do |id|
  #   # Trip.destroy(id.to_i)
  #   redirect '/trips'
  # end

end
