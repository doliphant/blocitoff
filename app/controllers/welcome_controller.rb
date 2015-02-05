class WelcomeController < ApplicationController

  def index
    @user = current_user
    @list = current_user.list
  end


  def list
  end

end
