# frozen_string_literal: true

class ScreenChannel < ApplicationCable::Channel
  def subscribed
    stream_from "screen_channel"
  end

  def operate(data)
    ActionCable.server.broadcast "screen_channel", operate: data["operate"]
  end
end
