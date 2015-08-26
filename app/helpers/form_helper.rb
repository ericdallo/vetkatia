module FormHelper

	def setup_pet pet		
		pet.vaccine ||= Vaccine.new
		pet
	end

end