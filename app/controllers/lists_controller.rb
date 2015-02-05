class ListsController < ApplicationController
before_action :authenticate_user!

  def show
    @list = current_user.list
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    # @list = List.new(params.require(:list).permit(:title))
    # @list.user = current_user
    @list = current_user.build_list(params.require(:list).permit(:title))
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list."
      render :new
    end
  end

  def edit
    @list = current_user.list
  end

  def update
    @list = current_user.list
    if @list.update_attributes(params.require(:list).permit(:title))
      flash[:notice] = "List Title has been updated."
      redirect_to @list
    else
      flash[:error] = "There was an error updating the list."
      render :edit
    end
  end

  def destroy
    @list = current_user.list
    name = @list.title

    if @list.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to new_list_path
    else
      flash[:error] = "There was an error deleting the list."
      render :show
    end
  end
end
