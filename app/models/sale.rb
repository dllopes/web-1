# == Schema Information
#
# Table name: sales
#
#  id               :integer          not null, primary key
#  purchaser_name   :string
#  item_description :string
#  item_price       :float
#  purchase_count   :integer
#  merchant_address :string
#  merchant_name    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Sale < ApplicationRecord
  attr_accessor :file_table

  validates :purchaser_name, :item_description, :item_price, :purchase_count,
            :merchant_address, :merchant_name, presence: true

  def self.regex_read_file_table
    /(.+)\t(.+)\t(.+)\t(.+)\t(.+)\t(.+)/
  end

  def self.map_scanned_attributes(scanned)
    attribute_names = scanned.shift
    scanned.map do |row|
      mapped_attributes = {}
      attribute_names.each_with_index do |name, index|
        mapped_attributes.merge! "#{name.parameterize.underscore}": row[index]
      end
      mapped_attributes
    end
  end
end
