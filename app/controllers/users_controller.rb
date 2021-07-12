class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    response.set_header("test", "test")
    render json: current_user
  end
end
