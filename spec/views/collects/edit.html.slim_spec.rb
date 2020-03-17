# frozen_string_literal: true

require "rails_helper"

RSpec.describe "collects/edit", type: :view do
  before(:each) do
    @collect = assign(:collect, Collect.create!(
                                  name: "MyString",
                                  file_name: "MyString"
                                ))
  end

  it "renders the edit collect form" do
    render

    assert_select "form[action=?][method=?]", collect_path(@collect), "post" do
      assert_select "input[name=?]", "collect[name]"

      assert_select "input[name=?]", "collect[file_name]"
    end
  end
end
