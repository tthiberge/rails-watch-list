class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # raise
    @bookmark.save
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
    # Pas besoin de list_id, on lui dit surtout qu'il a le droit de récupérer du formulaire (autorisation)
    # le comment qu'on entre à la main et le film (donc l'id du film) qu'on choisit dans la liste
    # On attribue la liste à la liste d'après avec @bookmark.list = @list
  end
end
