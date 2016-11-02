class CourseraApi
  	include HTTParty
	@@base_url = "https://api.coursera.org/api/courses.v1"

	def initialize
	end

	def courses(options={})
		self.class.get(@@base_url, options)
	end

	def store_metadata()
		courses = courses(query: {fields: "description,startDate,previewLink"})
		
		courses["elements"].each do |course|
			name = course["name"]
			description = course["description"]
			start = course["startDate"]
			id = course["id"]
			previewLink = course["previewLink"]
			CourseraCourse.create(name: name, coursera_id: id, url: previewLink, description: description, start_date: start, inactive: false)
		end

	end

	def delete_inactive_courses
		db_ids = CourseraCourse.active.pluck("coursera_id")

		api_ids = courses()
		coursera_ids = []
		api_ids["elements"].each do |course|
			coursera_ids << course["id"]
		end

		ids_to_delete = db_ids - coursera_ids
		CourseraCourse.where(coursera_id: ids_to_delete).update(inactive: true)
	end

end
