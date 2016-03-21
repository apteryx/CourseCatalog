class Course < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  has_many :segments, through: :subjects

  has_many :enrollments  
end
