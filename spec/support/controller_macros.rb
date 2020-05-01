module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
end