# frozen_string_literal: true

require "mini_magick"

GRAVITY = "center"
TEXT_POSITION = "0,0"
FONT = "./app/assets/fonts/irohamaru-Medium.ttf"
FONT_SIZE = 60
INDENTION_COUNT = 14
ROW_LIMIT = 2
BACKGROUND = "#FFFFFF"
FRAME_SIZE = "1280x960"
BELT = MiniMagick::Image.open("public/images_for_movie/belt.jpg")
BELT_POSITION = "+0+360"

class ArrangeImage
  def initialize(path, word)
    @image = arrange_size(MiniMagick::Image.open(path))
    @text = arrange_text(word)
    result = draw_text(put_belt(@image), @text)
    result.write path
  end

  private
    def arrange_text(text)
      text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end

    def arrange_size(image)
      image.combine_options do |config|
        config.background BACKGROUND
        config.gravity GRAVITY
        config.resize FRAME_SIZE
        config.extent FRAME_SIZE
      end
    end

    def put_belt(image)
      image.composite(BELT) do |config|
        config.compose "Multiply"
        config.geometry BELT_POSITION
      end
    end

    def draw_text(image, text)
      image.combine_options do |config|
        config.gravity GRAVITY
        config.font FONT
        config.pointsize FONT_SIZE
        config.draw "text #{TEXT_POSITION} '#{text}'"
      end
    end
end
