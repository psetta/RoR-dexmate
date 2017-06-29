class ModHealth < ApplicationRecord
	self.primary_key = "idmodHealth"
	
	# Validate
	validates :date,  presence: true
	validates :idUser_fk,  presence: true
	validates :date,  presence: true
	validates :height,  presence: true
	
	validates :pressureHigh,  presence: true
	validates :pressureLow,  presence: true
	
	validates :imc,  presence: true
	
end
