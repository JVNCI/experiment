class ItemsController < ApplicationController
    before_action :set_item, only: %i[show edit update destroy]
    
    def index
        @items = Item.all
    end
    
    def show
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to @item, notice: 'Item was successfully created.'
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @item.update(item_params)
            redirect_to @item, notice: 'Item was successfully updated.'
        else
            render :edit
        end
    end
    
    def destroy
        @item.destroy
        redirect_to items_url, notice: 'Item was successfully destroyed.'
    end
    
    private
    def set_item
        @item = Item.find(params[:id])
    end
    
    def item_params
        params.require(:item).permit(:name, :description)
    end
    
end