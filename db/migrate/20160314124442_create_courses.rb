class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :uid
      t.boolean :independent_study
      t.string :name
      t.string :code
      t.float :credits
      t.text :description

      t.timestamps null: false
    end

    add_index :courses, :uid, unique: true
  end
end
