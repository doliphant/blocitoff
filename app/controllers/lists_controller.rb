class ListsController < ApplicationController
before_action :authenticate_user!

  def show
    @list = current_user.list
  end

  def new
  end

  def edit
  end
end
