class ItemsController < ApplicationController

  # def new
  #   @item = Item.new
  # end

  def create
    @list = current_user.list
    @item = current_user.list.items.build(params.require(:item).permit(:name))
    @item.list = @list

    if @item.save
      flash[:notice] = "Item added to List."
      redirect_to @list
    else
      flash[:error] = "There was an error adding an item to the list."
      redirect_to @list
    end
  end

end
