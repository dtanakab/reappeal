# frozen_string_literal: true

require "rails_helper"

RSpec.describe Slide, type: :model do
  before do
    common_set_up
  end

  describe "arranged_text" do
    context "with element_type_id == 1" do
      it "return only column name" do
        expect(@slide_show.slides[0].arranged_text).to eq("スライドのタイトルテスト")
      end
    end
    context "with element_type_id != 1" do
      it "return column_name + search_word + before_word + after_word" do
        expect(@slide_show.slides[-1].arranged_text).to eq("免許/資格2：\n英検1級\n（2010年取得）")
      end
    end
  end

  describe "search_target?" do
    context "with active == true and search_word is not empty" do
      it "return true" do
        expect(@slide_show.slides[0].search_target?).to eq(true)
      end
    end
    context "with active == false and search_word is not empty" do
      it "return false" do
        expect(@slide_show.slides[-1].search_target?).to eq(false)
      end
    end
    context "with active == true and search_word is empty" do
      it "return false" do
        expect(@slide_show.slides[-2].search_target?).to eq(false)
      end
    end
  end
end
