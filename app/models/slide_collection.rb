# frozen_string_literal: true

require "google/apis/customsearch_v1"
require "open-uri"

class SlideCollection
  def initialize(slides)
    @slides = slides
  end

  def process_images
    @slides.each do |slide|
      if slide.element_type_id == 1
        @url = Constants::COVER
      else
        @url = fetch_image_url(slide.search_word)
      end
      image_processor = ImageProcessor.new(slide, @url)
      image_processor.execute
    end
  end

  private
    def fetch_image_url(search_word)
      searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
      searcher.key = ENV["API_KEY"]
      results = searcher.list_cses(search_word, cx: ENV["CSE_ID"], search_type: "image", num: 1, start: 1)
      results.items[0].link
    end
end
