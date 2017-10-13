class Admin::DashboardController < ApplicationController
  before_action :require_authentication  

  def show; end

  def require_authentication
    authenticate_or_request_with_http_basic do |u, p|
      true if u === ENV['ADMIN_USERNAME'] && p === ENV['ADMIN_PASSWORD']
    end
  end
end
