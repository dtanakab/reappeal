# frozen_string_literal: true

require "streamio-ffmpeg"

class Movie
  def initialize(start_num, title)
    movie = FFMPEG::Transcoder.new(
      "",
      "public/images_for_movie/#{title}.mp4",
      {
        resolution: "1280x720",
        aspect: 1.333333,
      },
      {
        input: "public/images_for_movie/%d.jpg",
        input_options: {
          framerate: "0.5",
          start_number: "#{start_num}",
        }
      }
    )
    movie.run
  end
end
