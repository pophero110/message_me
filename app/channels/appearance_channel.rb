class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    if current_user && !current_user.online
      ActionCable.server.broadcast "appearance_channel", { user: { id: current_user.id, online: true } }
      current_user.online = true
      current_user.save!
    end
  end

  def unsubscribed
    if current_user
      ActionCable.server.broadcast "appearance_channel", { user: { id: current_user.id, online: false } }
      current_user.online = false
      current_user.save!
    end
  end
end
