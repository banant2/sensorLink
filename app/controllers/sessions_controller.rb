class SessionsController < Devise::SessionsController

  def new
    super
    pp 'sessions controller is working'
  end

  def create
    # do the usual authentication stuff and get user
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)

    if logedin
      session[:user_id] = user.id
      pp 'sessions controller is working'
    end
  end

end
