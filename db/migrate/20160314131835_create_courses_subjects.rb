class CreateCoursesSubjects < ActiveRecord::Migration
  def change
    create_table :courses_subjects do |t|
      t.belongs_to :course, index: true
      t.belongs_to :subject, index: true
    end

  end
end
