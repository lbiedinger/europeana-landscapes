class PaintingsController < ApplicationController
  before_filter :authenticate

  before_action :set_painting, only: [:update, :destroy]

  def index
    @paintings = Painting.all
  end

  def update
    if @painting.update(painting_params)
      redirect_to paintings_url, notice: 'Painting was successfully updated.'
    else
      redirect_to paintings_url, warning: 'Painting was NOT updated.'
    end
  end

  def destroy
    @painting.destroy
    redirect_to paintings_url, notice: 'Painting was successfully destroyed.'

  end

  def create
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html { redirect_to paintings_url, notice: 'Painting was successfully added.' }
      else
        format.html { redirect_to paintings_url, warning: 'Painting was NOT added.' }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_painting
      @painting = Painting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def painting_params
      params.require(:painting).permit(:europeana_id, :location)
    end

    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        #for test purposes
        username == 'admin' && password == 'password123'
      end
    end

end
