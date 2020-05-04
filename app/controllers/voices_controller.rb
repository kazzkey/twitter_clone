class VoicesController < ApplicationController
  def index
    @voice = Voice.all
  end
  def new
    @voice = Voice.new
  end
  def create
    Voice.create(voice_params)
    redirect_to new_voice_path
  end
  private
  def voice_params
    params.require(:voice).permit(:content)
  end
end
