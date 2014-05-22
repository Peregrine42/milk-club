require 'spec_helper'

class AuthenticationHelperSpecThing
  include AuthenticationHelper
end

#describe AuthenticationHelper, "#current_user" do
  #let(:user)        { double(:user)                     }
  #let(:controller)  { AuthenticationHelperSpecThing.new }

  #before do
    #controller.stub(:session).and_return(ein: :ein_from_session, ouc: :ouc_from_session, user_name: :name_from_session, email: :email_from_session, admin: false)
    #Member.stub(:new_from_session).and_return(user)
  #end

  #it 'builds a new Member using the data saved in the session' do
    #Member.should_receive(:new_from_session).with(ein: :ein_from_session, ouc: :ouc_from_session, user_name: :name_from_session, email: :email_from_session, admin: false)
    #controller.current_user
  #end

  #it 'returns the new Member' do
    #controller.current_user.should == user
  #end
#end

describe AuthenticationHelper, "#current_user" do
  let(:user)        { double(:user)                     }
  let(:controller)  { AuthenticationHelperSpecThing.new }

  before do
    controller.stub(:session).and_return(ein: :ein_from_session)
    Member.stub(:find_for_session).and_return(user)
  end

  it 'finds the member who matches the ein in the session' do
    Member.should_receive(:find_for_session).with(:ein_from_session)
    controller.current_user
  end

  it 'returns the member' do
    controller.current_user.should == user
  end
end

describe AuthenticationHelper, '#current_user_logged_in?' do
  let(:controller)  { AuthenticationHelperSpecThing.new }

  it 'returns true if the session has a ein in it' do
    session = {:name => 'a name'}
    controller.stub(:session).and_return(session)
    controller.current_user_logged_in?.should be_true
  end

  it 'returns false if the session has a ein in it' do
    session = {}
    controller.stub(:session).and_return(session)
    controller.current_user_logged_in?.should be_false
  end
end

describe AuthenticationHelper, '#redirect_unless_logged_in' do
  let(:controller)  { AuthenticationHelperSpecThing.new }

  it 'returns true if the url is /login' do
    controller.stub(:url).and_return('http://www.example.com/login')
    controller.redirect_unless_logged_in.should be_true
  end

  it 'redirects to the login page for a different url if the user is not logged in' do
    controller.stub(:url).and_return('http://www.example.com/another_page')
    controller.stub(:current_user_logged_in?).and_return(false)

    controller.should_receive(:redirect).with('/login')
    controller.redirect_unless_logged_in
  end

  it 'returns true if the user is logged in' do
    controller.stub(:url).and_return('http://www.example.com/another_page')
    controller.stub(:current_user_logged_in?).and_return(true)

    controller.redirect_unless_logged_in.should be_true
  end
end
