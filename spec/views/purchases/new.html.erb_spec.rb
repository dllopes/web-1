require 'rails_helper'

RSpec.describe "purchases/new", type: :view do
  before(:each) do
    assign(:purchase, Purchase.new(
      :count => 1,
      :purchaser => nil,
      :item => nil,
      :merchant => nil
    ))
  end

  it "renders new purchase form" do
    render

    assert_select "form[action=?][method=?]", purchases_path, "post" do

      assert_select "input[name=?]", "purchase[count]"

      assert_select "input[name=?]", "purchase[purchaser_id]"

      assert_select "input[name=?]", "purchase[item_id]"

      assert_select "input[name=?]", "purchase[merchant_id]"
    end
  end
end
