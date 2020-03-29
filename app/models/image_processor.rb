# frozen_string_literal: true

require "mini_magick"
require "tempfile"

class ImageProcessor
  def initialize(slide, url)
    @slide = slide
    @image = arrange_size(MiniMagick::Image.open(url))
    @text = reshape_text(slide.arranged_text)
  end

  def execute
    result = draw_text(put_belt(@image), @text)
    Tempfile.create do |f|
      result.write f
      @slide.image = MiniMagick::Image.open(f)
      @slide.save
    end
  end

  private
    def reshape_text(text)
      text.scan(/.{1,#{Constants::INDENTION_COUNT}}/)[0...Constants::ROW_LIMIT].join("\n")
    end

    def arrange_size(image)
      image.combine_options do |config|
        config.background Constants::BACKGROUND
        config.gravity Constants::GRAVITY
        config.resize Constants::FRAME_SIZE
        config.extent Constants::FRAME_SIZE
      end
    end

    def put_belt(image)
      image.composite(Constants::BELT) do |config|
        config.compose "Multiply"
        config.geometry Constants::BELT_POSITION
      end
    end

    def draw_text(image, text)
      image.combine_options do |config|
        config.gravity Constants::GRAVITY
        config.font Constants::FONT
        config.pointsize Constants::FONT_SIZE
        config.draw "text #{Constants::TEXT_POSITION} '#{text}'"
      end
    end
end
