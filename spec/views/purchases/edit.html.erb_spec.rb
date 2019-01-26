require 'rails_helper'

RSpec.describe "purchases/edit", type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
      :count => 1,
      :purchaser => nil,
      :item => nil,
      :merchant => nil
    ))
  end

  it "renders the edit purchase form" do
    render

    assert_select "form[action=?][method=?]", purchase_path(@purchase), "post" do

      assert_select "input[name=?]", "purchase[count]"

      assert_select "input[name=?]", "purchase[purchaser_id]"

      assert_select "input[name=?]", "purchase[item_id]"

      assert_select "input[name=?]", "purchase[merchant_id]"
    end
  end
end
