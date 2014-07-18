require 'spec_helper'

describe "GET /member/new" do

  it "shows the new member page" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    get_as_admin '/members/new'
    expect(last_response.body).to match("New Member")
  end

end

describe 'POST /member/new' do

  context "good data" do
    it "adds a new member to the database" do
      params = { "name" => "any name",
                 "ein"  => "3",
                 "role" => "Admin" }

      Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))

      possible_member = double(:possible_member, :null_object => true)
      Member.should_receive(:new).with(params).and_return(possible_member)
      possible_member.should_receive(:save).and_return(true)

      post_as_admin '/members/new', params
    end

    it "confirms that the member has been created" do
      params = { "name" => "any name",
                 "ein"  => "3",
                 "role" => "Admin" }

      Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
      post_as_admin '/members/new', params
      follow_redirect!
      expect(last_response.body).to match "Member created successfully"
    end
  end

  context "no data" do

    it "warns that no member has been created" do
      params = { "name" => "",
                 "ein"  => "",
                 "role" => "Admin" }

      Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))

      post_as_admin '/members/new', params
      follow_redirect!
      expect(last_response.body).to match "Invalid member"
    end
  end

end

describe 'GET /member/edit/:id' do
  it "shows the edit page for a member" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))

    member = double(:member, name: "Hello", ein: 123, id: 1, role: "Admin")
    Member.stub(:find).with("1").and_return(member)
    get_as_admin("members/edit/1")
    expect(last_response.body).to match "Hello"
  end
end

describe 'POST /member/edit/:id' do

    it "updates members data" do
      params = { "id"   => "1",
                 "name" => "any name",
                 "ein"  => "3",
                 "role" => "Admin" }

      Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))

      member = double(:member, :null_object => true)
      Member.should_receive(:find).with(params["id"]).and_return(member)
      member.should_receive(:update).and_return(true)

      post_as_admin '/members/edit/1', params
    end
end
