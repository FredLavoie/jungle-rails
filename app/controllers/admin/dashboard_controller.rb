class Admin::DashboardController < ApplicationController
  before_filter :authorize
  
  http_basic_authenticate_with username: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  
  def show
  end
end
