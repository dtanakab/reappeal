# frozen_string_literal: true

require "google/apis/customsearch_v1"
require "open-uri"

COVER = "public/images_for_movie/belt.jpg"

class SlideCollection
  def initialize(slides)
    slides.each do |slide|
      if slide.element_type_id == 1
        slide.image = open(COVER)
      else
        slide.remote_image_url = fetch_image_url(slide.search_word)
      end
      slide.save
      ArrangeImage.new(slide)
    end
  end

  def fetch_image_url(search_word)
    searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
    searcher.key = ENV["API_KEY"]
    results = searcher.list_cses(search_word, cx: ENV["CSE_ID"], search_type: "image", num: 1, start: 1)
    results.items[0].link
  end
end
