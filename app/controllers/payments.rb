class App
  
  get '/payments' do
    @members = Member.all
    erb :payments
  end

  post '/payments' do
    PaymentUpdate.update params["payment"]
    redirect '/'
  end

end
