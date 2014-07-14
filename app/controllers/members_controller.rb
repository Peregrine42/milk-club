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

  get '/member/edit/:id' do
    @member = Member.find(params["id"])
    erb :'member/edit'
  end

  post '/member/edit/:id' do
    @member = Member.find(params["id"])
    if @member.update(params["member"])
      flash[:success] = "Member updated successfully"
      redirect "/member/edit/#{params["id"]}"
    else
      error_string = "Member not updated"
      error_string += "<p>"
      error_string += @member.errors.full_messages.join("</p><p>")
      error_string += "</p>"
      flash[:error] = error_string
      redirect "/member/edit/#{params["id"]}"
    end
  end

end
