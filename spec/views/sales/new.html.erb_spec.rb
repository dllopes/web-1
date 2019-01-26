require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    assign(:sale, Sale.new(
      :purchaser_name => "MyString",
      :item_description => "MyString",
      :item_price => 1.5,
      :purchase_count => 1,
      :merchant_address => "MyString",
      :merchant_name => "MyString"
    ))
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input[name=?]", "sale[purchaser_name]"

      assert_select "input[name=?]", "sale[item_description]"

      assert_select "input[name=?]", "sale[item_price]"

      assert_select "input[name=?]", "sale[purchase_count]"

      assert_select "input[name=?]", "sale[merchant_address]"

      assert_select "input[name=?]", "sale[merchant_name]"
    end
  end
end
