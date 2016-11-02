RSpec.describe CourseraApi, type: :model do  
  coursera = CourseraApi.new

  describe ".courses" do
	  it 'returns a list of courses' do
	    courses = coursera.courses

	    expect(courses.count).to be > 0
	  end
  end

  describe ".store_metadata" do
	  it 'creates CourseraCourse objects' do
	    coursera.store_metadata

	    expect(CourseraCourse.all.count).to be > 0
	  end
  end 

  describe ".delete_inactive_courses" do
  	it 'turns all courses that are no longer on coursera to inactive' do
  		CourseraCourse.create(name: "Intro To SQL", description: "Learn SQL", coursera_id: "1213", inactive: false)

  		coursera.delete_inactive_courses
  		course = CourseraCourse.where(coursera_id: "1213").first
  		expect(course.inactive).to eq(true)
  	end
  end 



end