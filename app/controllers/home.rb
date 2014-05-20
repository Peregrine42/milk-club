class App

  get '/' do
    @members = Member.all 
    erb :homepage
  end

end
