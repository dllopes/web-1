class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :description
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
