require 'rails_helper'

RSpec.describe ReadFile, type: :model do

  describe 'Read File' do

    context 'with valid file' do
      let(:file_table) { (attributes_for :sale)[:file_table] }
      let(:read_file) { ReadFile.scan(file_table, Sale.regex_read_file_table) }

      before { read_file }

      it 'saves sale' do
        expect(read_file.size).to eq(5)
      end
    end
  end
end
