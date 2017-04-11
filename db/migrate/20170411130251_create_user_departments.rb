class CreateUserDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_departments do |t|
      t.integer :user_id, index: true
      t.integer :department_id, index: true

      t.timestamps
    end
  end
end
