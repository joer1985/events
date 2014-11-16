class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :title
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :thumb
      t.string :purchase_link
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
