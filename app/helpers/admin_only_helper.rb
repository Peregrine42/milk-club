module AdminOnlyHelper

  def admin_only(*paths)
    paths.each do |path|
      before path do
        unless current_user.admin?
          flash[:error] = "This resource is for Administrators only"
          redirect '/'
        end
      end
    end
  end
end
