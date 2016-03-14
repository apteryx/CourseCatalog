json.array!(@courses) do |course|
  json.extract! course, :id, :independent_study, :name, :code, :credits, :description
  json.url course_url(course, format: :json)
end
