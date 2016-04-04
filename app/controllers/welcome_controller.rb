class WelcomeController < ApplicationController
  skip_before_action :authorize
  before_action :user_redirect

  def show
  end
end
