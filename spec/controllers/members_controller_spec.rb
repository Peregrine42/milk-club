require 'spec_helper'

describe "GET /member/new" do

  it "shows the new member page" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    get_as_admin '/member/new'
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

      post_as_admin '/member/new', params
    end

    it "confirms that the member has been created" do
      params = { "name" => "any name",
                 "ein"  => "3",
                 "role" => "Admin" }

      Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
      post_as_admin '/member/new', params
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

      post_as_admin '/member/new', params
      follow_redirect!
      expect(last_response.body).to match "Invalid member"
    end
  end

end
