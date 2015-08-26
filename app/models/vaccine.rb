class Vaccine < ActiveRecord::Base
  belongs_to :pet, :autosave => true

  def self.types
  	vac = ["V10 - Anual","V10 - 1ºdose","V10 - 2ºdose","V10 - 3ºdose","V10 - 4ºdose","Raiva","Giardia","Pneumodog","V7","Triplice Felina","Triplice Felina - 1º dose","Triplice Felina - 2º dose","Triplice Felina + Raiva"]
  	vac_columns = ["v10","v10_1","v10_2","v10_3","v10_4","raiva","giardia","pneumodog","v7","triplice_felina","triplice_felina_1","triplice_felina_2","triplice_felina_raiva"]

  	Hash[vac.zip(vac_columns.map { |i|
		i.include?(',') ? (i.split /, /) : i
	})]
  end
end
