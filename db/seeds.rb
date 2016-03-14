# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# parse the json
courses = ActiveSupport::JSON.decode(File.read('db/seeds/course.json'))
instructors = ActiveSupport::JSON.decode(File.read('db/seeds/instructor.json'))
subjects = ActiveSupport::JSON.decode(File.read('db/seeds/subject.json'))


# {"segments"=>
#   [{"name"=>"Courses of Instruction", "id"=>"0"},
#     {"id"=>"1", "name"=>"Primarily for Undergraduate Students"},
#     {"name"=>"For Both Undergraduate and Graduate Students", "id"=>"2"},
#     {"name"=>"Primarily for Graduate Students", "id"=>"3"},
#     {"name"=>"Cross-Listed in Mathematics", "id"=>"4"},
#     {"name"=>"Courses of Related Interest", "id"=>"5"}],
# "name"=>"Mathematics", "abbreviation"=>"Mathematics", "id"=>"1161-4700"}

subjects.each do |subject|
  subject["uid"] = subject.delete("id")

  segments = subject.delete("segments")
  s = Subject.create(subject)

  segments.each do |segment|
    segment["uid"] = segment.delete("id")
    segment[:subject] = s
    Segment.create(segment)
  end
end
#
# {"independent_study"=>true,
#   "name"=>"Independent Study",
#   "subjects"=>[{"segment"=>"1", "id"=>"1161-2000"}],
#   "code"=>"ECS 98B",
#   "credits"=>nil,
#   "description"=>"May be taken only by majors with the written permission of the ECS program coordinator.\n\nUsually offered every year.\nStaff",
#   "requirements"=>[]}

courses.each do |course|
  course["uid"] = course.delete("id")
  subjects = course.delete("subjects")
  requirements = course.delete("requirements")
  c = Course.create(course)

  subjects.each do |subject|
    s = Subject.find_by(uid: subject["id"])
    c.subjects << s unless s.nil?
  end

end

# # {"id"=>"20090040", "middle"=>nil, "first"=>"Baskar", "last"=>"Balasubramanyam", "email"=>"baskar@brandeis.edu"}
#
instructors.each do |instructor|
  instructor["uid"] = instructor.delete("id")
  Instructor.create(instructor)
end
