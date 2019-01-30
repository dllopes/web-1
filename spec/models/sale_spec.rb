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

  context 'When have a file table and scanned data' do
    let(:file_table) { (attributes_for :sale)[:file_table] }
    let(:read_file) { ReadFile.scan(file_table, Sale.regex_read_file_table) }
    let(:map_scanned_data) { Sale.map_scanned_data(read_file) }

    before { map_scanned_data }

    describe 'Map scanned data table' do

      context 'with valid file table' do

        it 'items size is equal to 4' do
          expect(map_scanned_data.size).to eq(4)
        end

      end

      context 'with invalid file table' do
        let(:file_table) { file_error }

        it 'saves sale' do
          expect(map_scanned_data.size).not_to eq(4)
        end
      end

    end

    describe 'Calc total gross income' do

      context 'with valid sales_mapped' do

        let(:calc_total_gross_income) { Sale.calc_total_gross_income(map_scanned_data) }

        before { calc_total_gross_income }

        it 'total is equal to 95.0' do
          expect(calc_total_gross_income).to eq(95.0)
        end

      end

      context 'with invalid sales_mapped' do
        let(:file_table) { file_error }
        let(:calc_total_gross_income) { Sale.calc_total_gross_income(map_scanned_data) }

        before { calc_total_gross_income }

        it 'total is equal to 0.0' do
          expect(calc_total_gross_income).to eq(0)
        end

      end

    end

  end

  def file_error
    Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/files/example_input_error.tab')))
  end
end
