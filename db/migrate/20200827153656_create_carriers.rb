class CreateCarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :carriers do |t|
      t.string :name
      t.string :model
      t.string :status

      t.timestamps
    end
  end
end
