# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions", type: :system do
  before { common_set_up }
  let(:slide_show) { create(:slide_show1) }

  describe "show" do
    context "sign_in regularly" do
      before do
        visit "/slide_shows/sign_in"
      end

      it "show sign_in page" do
        expect(page).to have_content "閲覧するスライドショーのIDとパスワードを入力"
      end

      it "back to top page" do
        click_link "トップページへ戻る"
        expect(page).to have_content "自己紹介スライドかんたん作成サービス"
      end

      it "sign_in and go slide_show" do
        fill_in "slide_show[show_name]", with: slide_show.show_name
        fill_in "slide_show[password]", with: slide_show.password
        click_button "スライドショーを見る"
        expect(page).to have_content "スライドショーページ"
      end
    end

    context "sign_in with wrong input" do
      before do
        visit "/slide_shows/sign_in"
      end

      it "show error with wrong password" do
        fill_in "slide_show[show_name]", with: slide_show.show_name
        fill_in "slide_show[password]", with: "ttttt"
        click_button "スライドショーを見る"
        expect(page).to have_content "IDあるいはパスワードが誤っています"
      end

      it "show error with wrong ID" do
        fill_in "slide_show[show_name]", with: "sasasa"
        fill_in "slide_show[password]", with: "testtest"
        click_button "スライドショーを見る"
        expect(page).to have_content "IDあるいはパスワードが誤っています"
      end
    end

    context "sign_in with already sign_in" do
      before do
        sign_in(slide_show)
      end

      it "show error message" do
        visit "/slide_shows/sign_in"
        expect(page).to have_content "すでにスライドショーの閲覧が可能です"
      end
    end
  end
end
