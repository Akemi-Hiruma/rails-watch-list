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

    if @list.save
      redirect_to lists_path, notice: 'list was successfully created.'
    else
      render :new
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_list
  #   @list = List.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
