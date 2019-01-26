# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  description :text
#  price       :float            default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
end
