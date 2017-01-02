class CreateTableUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles, id: false do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false
    end
  end
end
