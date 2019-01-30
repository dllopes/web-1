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

  # Use to normalize data for this model after scan with regex_read_file_table
  def self.map_scanned_data(scanned)
    attribute_names = scanned.shift
    scanned.map do |row|
      mapped_attributes = {}
      attribute_names.each_with_index do |name, index|
        mapped_attributes.merge! "#{name.parameterize.underscore}": row[index]
      end
      mapped_attributes
    end
  end

  #TODO RSPEC TEST
  # sales_mapped attribute is the result of map_scanned_data method
  def self.calc_total_gross_income(sales_mapped)
    sales_mapped
        .map{|sale| sale[:item_price].to_f * sale[:purchase_count].to_i}
        .reduce(:+)
  end
end
