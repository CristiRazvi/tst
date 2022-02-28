class ApplicationController < ActionController::Base

  private

  def rescue_with_notification(exception)
    flash[:notice] = exception
    redirect_to root_path
  end
end
