require 'rails_helper'

RSpec.describe "sales/show", type: :view do
  before(:each) do
    @sale = assign(:sale, Sale.create!(
      :purchaser_name => "Purchaser Name",
      :item_description => "Item Description",
      :item_price => 2.5,
      :purchase_count => 3,
      :merchant_address => "Merchant Address",
      :merchant_name => "Merchant Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Purchaser Name/)
    expect(rendered).to match(/Item Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Merchant Address/)
    expect(rendered).to match(/Merchant Name/)
  end
end
