class App < Sinatra::Base
  get '/multiplier' do
    erb :multiplier
  end

  post '/multiplier' do
    members = Member.all
    members.each do |member|
      parameter_key_string = member.name.downcase + "_multiplier"
      parameter_key_string.to_sym
      if params[parameter_key_string]
        member.multiplier = params[parameter_key_string]
      end
      member.save
      flash[:success] = "The multipliers have been updated"
    end

    redirect '/multiplier'
  end
end
