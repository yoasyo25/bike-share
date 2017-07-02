class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

end
