class App < Sinatra::Base

  get '/' do
    @members = Member.all 
    erb :homepage
  end

end
