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

FactoryBot.define do
  factory :sale do
    file_table { file }
    purchaser_name { 'João Silva' }
    item_description { 'R$10 off R$20 of food' }
    item_price { 10.0 }
    purchase_count { 2 }
    merchant_address { '987 Fake St' }
    merchant_name { 'Bob\'s Pizza' }
  end
end

def file
  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/files/example_input.tab')))
end
