# frozen_string_literal: true

require "mini_magick"

module Constants
  GRAVITY = "center"
  TEXT_POSITION = "0,0"
  FONT = "./app/assets/fonts/irohamaru-Medium.ttf"
  FONT_SIZE = 50
  INDENTION_COUNT = 14
  ROW_LIMIT = 3
  BACKGROUND = "#FFFFFF"
  FRAME_SIZE = "800x600"
  BELT = MiniMagick::Image.open("./app/assets/images/belt.jpg")
  BELT_POSITION = "+0+180"
  COVER = "./app/assets/images/belt.jpg"
end
