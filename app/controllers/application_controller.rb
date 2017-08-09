class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def get_error_messages_from(obj)
    obj.errors.any? ? obj.errors.full_messages : 'Something went wrong.'
  end
end
