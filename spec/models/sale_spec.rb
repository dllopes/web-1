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

require 'rails_helper'

RSpec.describe Sale, type: :model do

  describe 'Create Sale' do

    context 'with valid Params' do
      let(:sale_params) { attributes_for :sale, item_price: 10.0 }
      let(:create_sale) { Sale.create(sale_params) }

      before { create_sale }

      it 'saves sale' do
        expect(Sale.all.count).to eq(1)
        expect(create_sale.item_price).to be == 10.0
      end
    end

    context 'with invalid params' do
      let(:sale_params) { attributes_for(:sale, item_description: nil) }

      it "doesn't save obra" do
        expect(Sale.create(sale_params)).to_not be_persisted
      end
    end

  end

  describe 'Map scanned data table' do

    context 'with valid file table' do
      let(:file_table) { (attributes_for :sale)[:file_table] }
      let(:read_file) { ReadFile.scan(file_table, Sale.regex_read_file_table) }
      let(:map_scanned_attributes) { Sale.map_scanned_attributes(read_file) }

      before { map_scanned_attributes }

      it 'items size is equal to 4' do
        expect(map_scanned_attributes.size).to eq(4)
      end
    end

    context 'with invalid file table' do
      let(:file_table) { file_error }
      let(:read_file) { ReadFile.scan(file_table, Sale.regex_read_file_table) }
      let(:map_scanned_attributes) { Sale.map_scanned_attributes(read_file) }

      before { map_scanned_attributes }

      it 'saves sale' do
        expect(map_scanned_attributes.size).to eq(2)
      end
    end

  end

  def file_error
    Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/files/example_input_error.tab')))
  end
end
