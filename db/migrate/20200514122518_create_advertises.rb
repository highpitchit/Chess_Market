class CreateAdvertises < ActiveRecord::Migration[6.0]
  def change
    create_table :advertises do |t|
      t.date :date
      t.string :title
      t.text :offering

      t.timestamps
    end
  end
end
