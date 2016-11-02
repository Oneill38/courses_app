class AddInactiveToCourseraCourses < ActiveRecord::Migration[5.0]
  def change
  	add_column :coursera_courses, :inactive, :boolean, default: false
  end
end
