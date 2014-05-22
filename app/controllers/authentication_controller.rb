class App < Sinatra::Base
  before do
    redirect_unless_logged_in
  end

  get '/login' do
    erb :'authentication/new'
  end

  post '/login' do
    begin
      user = App.development? ?
        Member.new(ein: '99999999', name: "Fred Flintstone", role: 'Admin') :
        Authenticator.user_with_credentials(params[:user])
      session.clear
      session[:name] = user.name
      session[:role] = user.role
      session[:ein]  = user.ein
      redirect '/'
    rescue AuthenticationException
      flash.now[:error] = 'Your user details are invalid'
      erb :'authentication/new'
    rescue ActiveRecord::RecordNotFound
      flash.now[:error] = 'Your do not have permission to access this application.'
      erb :'authentication/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end
