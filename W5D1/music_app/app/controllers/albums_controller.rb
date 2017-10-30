class AlbumsController < ApplicationController

  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      redirect_to bands_url
    end
  end

  def new
    render :new
  end

  def create
    @album = Album.new(album_params)
    @album.save
    render :show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def album_params
    params.require(:albums).permit(:title, :band_id, :year, :is_studio)
  end

end
