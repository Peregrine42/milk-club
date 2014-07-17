class App < Sinatra::Base

  #member_only  '/members'

  get '/members' do
    erb :'members/members'
  end

  get '/members/new' do
    erb :'members/new'
  end

  post '/members/new' do
    new_member = Member.new(params)

    if new_member.save
      flash[:success] = "Member created successfully"
      redirect '/members/new'
    else
      error_string = "Invalid member"
      error_string += "<p>"
      error_string += new_member.errors.full_messages.join("</p><p>")
      error_string += "</p>"
      flash[:error] = error_string
      redirect '/members/new'
    end
  end

  get '/members/edit/:id' do
    @member = Member.find(params["id"])
    erb :'members/edit'
  end

  post '/members/edit/:id' do
    @member = Member.find(params["id"])
    if @member.update(params["member"])
      flash[:success] = "Member updated successfully"
      redirect "/members/edit/#{params["id"]}"
    else
      error_string = "Member not updated"
      error_string += "<p>"
      error_string += @member.errors.full_messages.join("</p><p>")
      error_string += "</p>"
      flash[:error] = error_string
      redirect "/members/edit/#{params["id"]}"
    end
  end

  get '/members/delete/:id' do
    member = Member.find_by(id: params[:id].to_i)
    member.destroy!
    flash[:success] = "Member deleted successfully"
    redirect '/members/members'
  end
end
