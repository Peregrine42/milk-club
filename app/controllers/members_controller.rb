class App < Sinatra::Base
  get '/members' do
    erb :'members_page'
  end
end
