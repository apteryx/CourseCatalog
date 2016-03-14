class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :uid, null: false
      t.string :name
      t.belongs_to :subject, index: true

      t.timestamps null: false
    end

    add_index :segments, [:uid, :subject_id], unique: true
  end
end
