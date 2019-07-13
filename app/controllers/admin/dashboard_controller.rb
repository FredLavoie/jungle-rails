class Admin::DashboardController < ApplicationController
  before_filter :authorize
  
  include HttpAuthConcern
  
  def show
  end
end
