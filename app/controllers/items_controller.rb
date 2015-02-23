class ItemsController < ApplicationController

  respond_to :html, :js

  # def new
  #   @item = Item.new
  # end

  def create
    @list = current_user.list
    @item = @list.items.build(item_params)
    @new_item = Item.new
    # @item.list = @list

    if @item.save
      flash[:notice] = "ToDo item added to List."
    else
      flash[:error] = "There was an error adding an item to the list."
    end

    respond_with(@item) do |format|
      format.html { redirect_to [@list] }
    end

  end

  def destroy
    @list = current_user.list
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "ToDo item removed."
      # redirect_to @list
    else
      flash[:error] = "Item could not be removed."
      # redirect_to @list
    end

    respond_with(@item) do |format|
      format.html { redirect_to [@list] }
    end

  end

  def completed
    #migrate a completed_at time into items
    #nest in routes (done)
    #completed will update completed at value
    #edit show to only show incomplete
  end


  def item_params
    params.require(:item).permit(:name)
  end

end
