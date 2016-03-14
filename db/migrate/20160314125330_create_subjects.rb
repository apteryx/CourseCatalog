class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :abbreviation
      t.string :uid, null: false


      t.timestamps null: false
    end

    add_index :subjects, :uid, unique: true
  end
end
