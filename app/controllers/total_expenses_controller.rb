class App < Sinatra::Base


  get '/total_expenses' do
    @total_expenses    = 0
    @total_paid        = 0

    Member.all.each do |member|
      @total_expenses += member.total_owed
      @total_paid     += member.total_paid
    end

    erb :total_expenses
  end
end
