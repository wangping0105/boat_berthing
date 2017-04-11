class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :parent_id, index: true
      t.string :path, default: "0"
      t.integer :user_count, default: 0
      t.boolean :is_default, default: false
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
