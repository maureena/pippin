class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :body
      t.string :address
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
