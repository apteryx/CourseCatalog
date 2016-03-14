json.array!(@instructors) do |instructor|
  json.extract! instructor, :id, :middle, :first, :last, :email, :id
  json.url instructor_url(instructor, format: :json)
end
