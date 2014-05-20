class App

  get '/new_amount_due' do
    erb :new_amount_due
  end

  post '/new_amount_due' do
    amount = Fee.most_recent
    members = Member.all
    Due.for_members(amount, members)
    redirect '/'
  end

end
