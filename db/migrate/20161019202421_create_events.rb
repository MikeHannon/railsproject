class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :state
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
