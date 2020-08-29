class CreateAccessConnectionData < ActiveRecord::Migration[6.0]
  def change
    create_table :access_connection_data do |t|
      t.json :access_data
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
