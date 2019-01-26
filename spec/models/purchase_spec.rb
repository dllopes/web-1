# == Schema Information
#
# Table name: purchases
#
#  id           :integer          not null, primary key
#  count        :integer
#  purchaser_id :integer
#  item_id      :integer
#  merchant_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
