class ApplicationController < ActionController::Base

  protect_from_forgery(with: :exception)

  before_action(:before_action_set_current_user)

  private

  def current_user
    @current_user
  end
  helper_method(:current_user)

  def before_action_set_current_user
    @current_user = User.from_session(session)
    true
  end

end
