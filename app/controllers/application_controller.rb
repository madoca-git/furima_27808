class ApplicationController < ActionController::Base
  before_action :basic_auth
  
  private
  
  def basic_auth
    authrntiate_or_request_with_http_basic do |username, password|
      user_name == 'madoca' && password == '1029'
    end
  end

end