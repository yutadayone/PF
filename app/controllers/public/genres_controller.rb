class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  #private

  #def genre_params
     #params.require(:genre).permit(:genre_name, :customer_id)
  #end
end
