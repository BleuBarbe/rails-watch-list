class ListsController < ApplicationController

  # Un utilisateur peut voir toutes les listes
  # GET "lists"
  # Un utilisateur peut voir les détails d’une liste donnée et son nom
  # GET "lists/42"
  # Un utilisateur peut créer une nouvelle liste
  # GET "lists/new"
  # POST "lists"

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :image_url)
  end
end
