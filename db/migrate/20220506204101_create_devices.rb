class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.string :status
      t.integer :request_count
      t.string :category

      t.timestamps
    end
  end
end
