class App < Sinatra::Base

  #member_only  '/members'

  get '/members' do
  end

  get '/member/new' do
    erb :'member/new'
  end

  post '/member/new' do
    new_member = Member.new(params)

    if new_member.save
      flash[:success] = "Member created successfully"
      redirect '/member/new'
    else
      error_string = "Invalid member"
      error_string += "<p>"
      error_string += new_member.errors.full_messages.join("</p><p>")
      error_string += "</p>"
      flash[:error] = error_string
      redirect '/member/new'
    end
  end

end
