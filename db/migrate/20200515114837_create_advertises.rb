class CreateAdvertises < ActiveRecord::Migration[6.0]
  def change
    create_table :advertises do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :title
      t.text :job_offer

      t.timestamps
    end
  end
end
