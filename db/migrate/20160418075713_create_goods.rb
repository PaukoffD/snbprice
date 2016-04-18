class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string	:name
	  t.string	:marka
	  t.string	:size
	  t.integer	:length
	  t.integer	:width
	  t.integer	:height
	  t.integer	:weight
	  t.integer	:price
	  t.integer	:price1
	  t.integer	:price2
	  t.integer	:price3
	  t.date	:dataprice
	  t.integer	:user_id
      t.timestamps null: false
    end
  end
end
