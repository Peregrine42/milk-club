class App

  get '/' do
    @members = Member.all 
    erb :members_report
  end

end
