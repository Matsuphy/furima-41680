class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string      :post_code,     null: false
      t.integer     :region_id,     null: false
      t.string      :city,          null: false
      t.string      :street,        null: false
      t.string      :room 
      t.string      :phone_number,  null: false
      t.references  :status,        null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
