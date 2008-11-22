class Application < Merb::Controller
  private
    def current_user
      session.authentication.user
    end
end