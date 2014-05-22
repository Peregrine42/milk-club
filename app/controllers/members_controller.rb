class App < Sinatra::Base

  #member_only  '/members'

  get '/members' do
    erb :'members_page'
  end
end
