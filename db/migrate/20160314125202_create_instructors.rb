class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :middle
      t.string :first
      t.string :last
      t.string :email
      t.string :uid, null: false

      t.timestamps null: false
    end

    add_index :instructors, :uid, unique: true
  end
end
