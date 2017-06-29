class ModCalendar < ApplicationRecord
	self.primary_key = "idcalendar"
	
	mount_uploader :photo, CalendarImageUploader

	attr_accessor :startDay
	attr_accessor :startMonth
	attr_accessor :startYear
	attr_accessor :startHour
	attr_accessor :startMin

	attr_accessor :endDay
	attr_accessor :endMonth
	attr_accessor :endYear
	attr_accessor :endHour
	attr_accessor :endMin

	# Validate
	
	validates :name,  presence: true, length: { maximum: 45 }
	validates :date,  presence: true
	validates :dateF,  presence: true
	validates :category,  presence: true, length: { maximum: 45 }
	validates :anualRep,  presence: true
	validates :text,  presence: false, length: { maximum: 1000 }
	validates :color,  presence: true, length: { maximum: 45 }
	validates :idUser_fk,  presence: true
	
end
