# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Registrations", type: :system do
  before { common_setup }
  let(:slide_show) { create(:slide_show1) }

  describe "show" do
    context "sign_up regularly" do
      before do
        visit "/slide_shows/sign_up"
      end

      it "show sign_up page" do
        expect(page).to have_content "スライドショーIDとパスワードを他の人と共有"
      end

      it "back to top page" do
        click_link "トップページへ戻る"
        expect(page).to have_content "自己紹介スライドかんたん作成サービス"
      end

      it "sign_up and go edit page" do
        fill_in "slide_show[show_name]", with: "newshow"
        fill_in "slide_show[password]", with: "testtest"
        fill_in "slide_show[password_confirmation]", with: "testtest"
        click_button "スライドショーID・パスワードを決定"
        expect(page).to have_content "自己紹介内容を作成"
      end
    end

    context "sign_up with wrong input" do
      before do
        visit "/slide_shows/sign_up"
      end

      it "show error with not uniq show_name" do
        fill_in "slide_show[show_name]", with: slide_show.show_name
        click_button "スライドショーID・パスワードを決定"
        expect(page).to have_content "スライドショーID は既に使用されています"
      end

      it "show error with too short password" do
        fill_in "slide_show[password]", with: "aa"
        fill_in "slide_show[password_confirmation]", with: "aa"
        click_button "スライドショーID・パスワードを決定"
        expect(page).to have_content "パスワード は6文字以上に設定して下さい。"
      end

      it "show error with too short id" do
        fill_in "slide_show[show_name]", with: "abc"
        click_button "スライドショーID・パスワードを決定"
        expect(page).to have_content "スライドショーID は4文字以上に設定して下さい"
      end

      it "show error with カタカナ" do
        fill_in "slide_show[show_name]", with: "テスト"
        click_button "スライドショーID・パスワードを決定"
        expect(page).to have_content "スライドショーIDは4~20文字の半角英数字です"
      end
    end
  end
end
