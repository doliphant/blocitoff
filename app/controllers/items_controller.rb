class ItemsController < ApplicationController

  # def new
  #   @item = Item.new
  # end

  def create
    @list = current_user.list
    @item = @list.items.build(item_params)
    # @item.list = @list

    if @item.save
      flash[:notice] = "ToDo item added to List."
# switched from @list to @item or [@list, @item] and now it at least shows flash notice on refresh
      redirect_to @item
    else
      flash[:error] = "There was an error adding an item to the list."
      redirect_to @list
    end
  end

  def destroy
    @list = current_user.list
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "ToDo item removed."
      redirect_to @list
    else
      flash[:error] = "Item could not be removed."
      redirect_to @list
    end
  end


  def item_params
    params.require(:item).permit(:name)
  end

end
