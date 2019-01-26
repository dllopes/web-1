require 'rails_helper'

RSpec.describe "sales/edit", type: :view do
  before(:each) do
    @sale = assign(:sale, Sale.create!(
      :purchaser_name => "MyString",
      :item_description => "MyString",
      :item_price => 1.5,
      :purchase_count => 1,
      :merchant_address => "MyString",
      :merchant_name => "MyString"
    ))
  end

  it "renders the edit sale form" do
    render

    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do

      assert_select "input[name=?]", "sale[purchaser_name]"

      assert_select "input[name=?]", "sale[item_description]"

      assert_select "input[name=?]", "sale[item_price]"

      assert_select "input[name=?]", "sale[purchase_count]"

      assert_select "input[name=?]", "sale[merchant_address]"

      assert_select "input[name=?]", "sale[merchant_name]"
    end
  end
end
