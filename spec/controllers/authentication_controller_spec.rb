require 'spec_helper'

def session
  last_request.env['rack.session']
end

describe 'GET /login' do
  it 'renders the login page' do
    get '/login'
    last_response.body.should =~ /EIN/
  end
end

describe 'POST /login - successful login' do
  let(:user) { double(:user,  :name => 'name from authenticator',
                              :role => 'role from authenticator',
                              :ein  =>  'ein from authenticator') }

  before do
    Authenticator.stub(:user_with_credentials).and_return(user)
  end

  it 'gets a user from the Authenticator using the provided credentials' do
    Authenticator.should_receive(:user_with_credentials).with('user_params')
    post '/login', 'user' => 'user_params'
  end

  it 'saves the ein in the session' do
    post '/login'
    session[:ein].should == 'ein from authenticator'
  end

  it 'redirects to the my account page' do
    post '/login'
    expect(last_response).to redirect_to('/my_account')
  end
end

describe 'POST /login - invalid login' do
  before do
    Authenticator.stub(:user_with_credentials).and_raise(AuthenticationException)
  end

  it 'renders the login page' do
    post '/login'
    last_response.body.should =~ /Password/
  end

  it 'shows an invalid login message' do
    post '/login'
    last_response.body.should =~ /invalid/
  end
end

describe 'POST /login - login when not in database' do
  before do
    Authenticator.stub(:user_with_credentials).and_raise(ActiveRecord::RecordNotFound)
  end

  it 'renders the login page' do
    post '/login'
    last_response.body.should =~ /Password/
  end

  it 'shows a permission denied message' do
    post '/login'
    last_response.body.should =~ /permission/
  end
end

describe 'GET /logout' do

  it 'clears the session' do
    get '/logout', {}, 'rack.session' => { ein: 'fred' }
    session.should be_empty
  end

  it 'redirects to the login page' do
    get '/logout'
    last_response.should be_a_redirect
    follow_redirect!
    last_response.body.should =~ /Password/
  end
end
