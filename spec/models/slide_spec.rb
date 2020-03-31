# frozen_string_literal: true

require "rails_helper"

RSpec.describe Slide, type: :model do
  before { common_setup }
  let(:slide_show) { create(:slide_show1) }
  subject { slide_show.slides }

  describe "arranged_text" do
    context "with element_type_id == 1" do
      it { expect(subject[0].arranged_text).to eq("スライドのタイトルテスト") }
    end

    context "with element_type_id != 1" do
      it { expect(subject[-1].arranged_text).to eq("免許/資格2：\n英検1級\n（2010年取得）") }
    end
  end

  describe "search_target?" do
    context "with active == true and search_word is not empty" do
      it { expect(subject[0].search_target?).to be true }
    end

    context "with active == false and search_word is not empty" do
      it { expect(subject[-1].search_target?).to be false }
    end

    context "with active == true and search_word is empty" do
      it { expect(subject[-2].search_target?).to be false }
    end
  end
end
