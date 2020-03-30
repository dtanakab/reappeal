# frozen_string_literal: true

require "rails_helper"

RSpec.describe "SlideShow", type: :system do
  before { common_set_up }

  describe "show" do
    context "with sign_in and any slides" do
      let(:slide_show) { create(:slide_show3) }
      before do
        sign_in(slide_show)
        visit "/slide_shows/#{slide_show.id}"
      end

      it "display introduction" do
        expect(page).to have_content "あなたの他に本スライドショーの閲覧者が存在"
      end

      it "display next image" do
        click_button "次へ"
        expect(page).to have_content "2 ／ 3 ページ"
      end

      it "display preview image" do
        click_button "次へ"
        click_button "前へ"
        expect(page).to have_content "1 ／ 3 ページ"
      end

      it "disconnect screen channel" do
        click_button "他閲覧者とのスライドページの同期を解除"
        expect(page).to have_content "現在あなたの閲覧スライドページは共有されていません"
      end

      it "connect screen channel" do
        click_button "他閲覧者とのスライドページの同期を解除"
        click_button "他閲覧者とスライドページを同期する"
        expect(page).to have_content "同期設定にしている場合、閲覧スライドページが共有されます"
      end
    end

    context "with sign_in and no slides" do
      let(:slide_show) { create(:slide_show2) }
      before do
        sign_in(slide_show)
        visit "/slide_shows/#{slide_show.id}"
      end

      it "return warning" do
        expect(page).to have_content "まだスライドが作成されていません"
      end

      it "go edit page" do
        click_on "項目を入力してスライドショーを作成"
        expect(page).to have_content "自己紹介内容を作成"
      end

      it "back top page" do
        click_on "トップページへ戻る"
        expect(page).to have_content "自己紹介スライドかんたん作成サービス"
      end
    end

    context "without sign_in" do
      let(:slide_show) { create(:slide_show1) }
      it "return top page" do
        visit "/slide_shows/#{slide_show.id}"
        expect(page).to have_content "スライドショーIDとパスワードの入力が必要です"
      end
    end
  end

  describe "edit" do
    let(:slide_show) { create(:slide_show1) }
    context "with sign_in and has no visible_slides" do
      before do
        sign_in(slide_show)
        visit "/slide_shows/#{slide_show.id}/edit"
      end

      it "return slide_show" do
        expect(page).to have_content "表示できるスライドがありません"
      end

      it "back to top page" do
        click_link "トップページへ戻る"
        expect(page).to have_content "自己紹介スライドかんたん作成サービス"
      end
    end

    context "without sign_in" do
      it "show edit page" do
        visit "/slide_shows/#{slide_show.id}/edit"
        expect(page).to have_content "スライドショーIDとパスワードの入力が必要です"
      end
    end

    context "with sign_in and has visible_slides" do
      let(:slide_show) { create(:slide_show3) }
      it "return slide_show page" do
        sign_in(slide_show)
        visit "/slide_shows/#{slide_show.id}/edit"
        expect(page).to have_content "すでにスライドショーを作成済みです"
      end
    end
  end

  describe "update" do
    context "with sign_up" do
      let(:slide_show) { create(:slide_show2) }
      it "create slideshow" do
        sign_in(slide_show)
        visit "/slide_shows/#{slide_show.id}/edit"
        fill_in "slide_show[slides_attributes][0][search_word]", with: "表紙タイトル"
        fill_in "slide_show[slides_attributes][1][search_word]", with: "テスト高校"
        click_button "スライドショーを作成"
        expect(page).to have_content "1 ／ 2 ページ"
      end
    end
  end
end
