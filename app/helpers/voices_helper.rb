module VoicesHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_voices_path
    elsif action_name == 'edit'
      voice_path
    end
  end
end
