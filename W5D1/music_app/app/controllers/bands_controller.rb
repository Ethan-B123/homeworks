class BandsController < ApplicationController

  def index #done
    @bands = Band.all
  end

  def show #done
    @band = Band.find_by(id: params[:id])
    if @band
      render :show
    else
      redirect_to bands_url
    end
  end

  def new #done
  end

  def create #done
    @band = Band.new(band_params)
    @band.save
    render :show
  end

  def edit #done
    @band = Band.find_by(id: params[:id])
    if @band
      render :edit
    else
      redirect_to bands_url
    end
  end

  def update #done
    @band = Band.find_by(id: params[:id])
    @band.update_attributes(band_params)
    redirect_to band_url(@band.id)
  end

  def destroy #TODO
    @band = Band.find_by(id: params[:id])
    if @band
      @band.destroy
    end
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:bands).permit(:name)
  end

end
