# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Top", type: :system do
  before do
    common_set_up
  end

  describe "show" do
    context "with sign_in" do
      before do
        sign_in(@slide_show)
        visit root_path
      end
      it "show title" do
        expect(page).to have_content "自己紹介スライドかんたん作成サービス"
      end
      it "go slide_show" do
        click_link "スライドショーを見る"
        expect(page).to have_content "スライドショーページ"
      end
      it "go signup page" do
        click_link "新たなスライドショーを作成"
        expect(page).to have_content "スライドショーID（英数字4~20字, 重複不可）"
      end
    end

    context "without sign_in" do
      before do
        visit root_path
      end
      it "show title" do
        expect(page).to have_content "自己紹介スライドかんたん作成サービス"
      end
      it "go slide_show" do
        click_link "IDとパスワードを入力してスライドショーを見る"
        expect(page).to have_content "閲覧するスライドショーのIDとパスワードを入力"
      end
      it "go signup page" do
        click_link "新たなスライドショーを作成"
        expect(page).to have_content "スライドショーID（英数字4~20字, 重複不可）"
      end
    end
  end
end
