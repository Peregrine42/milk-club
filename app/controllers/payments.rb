class App < Sinatra::Base

  get '/payments' do
    @members = Member.all
    erb :payments
  end

  post '/payments' do
    PaymentUpdate.update params["payment"]
    redirect '/'
  end

end
