class CreateCourseraCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :coursera_courses do |t|
      t.string :name, null: false
      t.string :coursera_id, null: false
      t.text :description, null: false
      t.string :url
      t.datetime :start_date
      t.timestamps
    end
  end
end
