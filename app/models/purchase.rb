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

class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

  attr_accessor :table_file

  private

  def read_table_file
    self.attributes = ReadFile.scan(table_file)
  end
end
