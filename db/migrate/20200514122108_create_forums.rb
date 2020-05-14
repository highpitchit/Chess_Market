class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.date :date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
