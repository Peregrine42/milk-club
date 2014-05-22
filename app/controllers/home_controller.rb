class App < Sinatra::Base

  #member_only  '/my_account'

  get '/' do
    @members = Member.all
    erb :homepage
  end

  get '/my_account' do
    erb :'home/my_account'
  end

end
