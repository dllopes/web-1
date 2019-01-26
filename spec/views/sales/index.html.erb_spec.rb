require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    assign(:sales, [
      Sale.create!(
        :purchaser_name => "Purchaser Name",
        :item_description => "Item Description",
        :item_price => 2.5,
        :purchase_count => 3,
        :merchant_address => "Merchant Address",
        :merchant_name => "Merchant Name"
      ),
      Sale.create!(
        :purchaser_name => "Purchaser Name",
        :item_description => "Item Description",
        :item_price => 2.5,
        :purchase_count => 3,
        :merchant_address => "Merchant Address",
        :merchant_name => "Merchant Name"
      )
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => "Purchaser Name".to_s, :count => 2
    assert_select "tr>td", :text => "Item Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Address".to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Name".to_s, :count => 2
  end
end
