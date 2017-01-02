class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.belongs_to :role, null: false
      t.string :action, null: false
      t.string :subject, null: false

      t.timestamps null: false
    end
  end
end
