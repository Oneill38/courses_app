class CourseraCourse < ActiveRecord::Base
	validates :name, :description, :coursera_id, presence: true
	validates :coursera_id, uniqueness: true

	scope :inactive, -> { where(inactive: true) }
	scope :active, -> { where(inactive: false)}
end