# frozen_string_literal: true

require "rails_helper"

RSpec.describe "collects/new", type: :view do
  before(:each) do
    assign(:collect, Collect.new(
                       name: "MyString",
                       file_name: "MyString"
                     ))
  end

  it "renders new collect form" do
    render

    assert_select "form[action=?][method=?]", collects_path, "post" do
      assert_select "input[name=?]", "collect[name]"

      assert_select "input[name=?]", "collect[file_name]"
    end
  end
end
