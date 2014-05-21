module MemberOnlyHelper

  def member_only(*paths)
    paths.each do |path|
      before path do
        unless current_user.logged_in?
          redirect '/login'
        end
      end
    end
  end
end
