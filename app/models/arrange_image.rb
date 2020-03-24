# frozen_string_literal: true

require "mini_magick"
require "tempfile"

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

class ArrangeImage
  def initialize(slide, url)
    @image = arrange_size(MiniMagick::Image.open(url))
    @text = reshape_text(slide.arranged_text)
    result = draw_text(put_belt(@image), @text)
    Tempfile.create do |f|
      result.write f
      slide.image = MiniMagick::Image.open(f)
      slide.save
    end
  end

  private
    def reshape_text(text)
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
