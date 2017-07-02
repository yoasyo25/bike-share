class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

  # get '/stations/error'
  #   erb :error
  # end

  get '/stations/new' do
    @station = Station.all
    @city = City.all
    erb :new
  end

  post '/stations' do
    # require 'pry'; binding.pry
    if params[:station[:name]] == nil
      redirect "/stations/error"
    else
      @station = Station.create(params[:station])
      redirect "/stations/#{@station.id}"
    end
  end
end
