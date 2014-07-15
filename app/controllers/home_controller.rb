class App < Sinatra::Base

  get '/' do
    @members = Member.all
    erb :homepage
  end

  get '/my_account' do
    erb :'home/my_account'
  end

end
