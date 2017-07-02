class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/stations' do
    erb :"stations/index"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

end
