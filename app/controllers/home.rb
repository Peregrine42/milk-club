class App

  get '/' do
    @unpaid = MembersReport.new.unpaid
    erb :members_report
  end

end
