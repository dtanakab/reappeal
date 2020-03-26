# frozen_string_literal: true

class ScreenChannel < ApplicationCable::Channel
  def subscribed
    stream_from "screen_channel_#{params["slide_show_id"]}"
  end

  def operate(data)
    ActionCable.server.broadcast "screen_channel_#{data["slide_show_id"]}", operate: data["operate"]
  end
end
