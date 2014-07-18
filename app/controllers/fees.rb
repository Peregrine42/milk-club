class App < Sinatra::Base

  get '/fees' do
    @fee = Fee.most_recent
    erb :fees
  end

  post '/fees' do
    if params[:fee].to_f != Fee.most_recent and params[:fee].to_f > 0
      Fee.create(amount: params[:fee].to_f)
      flash[:success] = "The fee has been updated"
    else
      flash[:error] = "The fee has not been changed"
    end
    redirect '/fees'
  end

end
