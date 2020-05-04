class VoicesController < ApplicationController
  def index
    @voice = Voice.all
  end
  def new
    @voice = Voice.new
  end
  def create
    @voice = Voice.new(voice_params)
    if @voice.save
      redirect_to voices_path
    else
      render :new
    end
  end
  # def edit
  #   @voice = Voice.find(params[:id])
  # end
  private
  def voice_params
    params.require(:voice).permit(:content)
  end
end
