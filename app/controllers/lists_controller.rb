class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # OPTION: pouvoir supprimer la liste, mais aussi, faire en sorte que l'image associée soit supprimée de cloudinary
  # De sorte à ne pas surcharger son cloud (notamment avec les images ajoutées par les users)
  def destroy
    @list = List.find(params[:id])
    if @list.photo.attached?
      @list.photo.purge # UTILE
    end
    @list.destroy
    redirect_to lists_path
    # if @list.destroy
    #   redirect_to lists_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
