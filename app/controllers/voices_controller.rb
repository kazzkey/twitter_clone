class VoicesController < ApplicationController
  before_action :set_voice, only: [:edit, :update, :destroy]
  def index
    @voices = Voice.all
  end
  def new
    @voice = Voice.new
  end
  def create
    @voice = Voice.new(voice_params)
    if params[:back]
      render :new
    else
      if @voice.save
        redirect_to voices_path, notice:"新規作成しました！"
      else
        render :new
      end
    end
  end
  def confirm
    @voice = Voice.new(voice_params)
    render :new if @voice.invalid?
  end
  def edit

  end
  def update
    if @voice.update(voice_params)
      redirect_to voices_path, notice:"編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @voice.destroy
    redirect_to voices_path, notice:"削除しました！"
  end
  private
  def voice_params
    params.require(:voice).permit(:content)
  end
  def set_voice
    @voice = Voice.find(params[:id])
  end
end
