class Pet < ActiveRecord::Base
  belongs_to :cliente
  has_one :vaccine,  dependent: :destroy
  accepts_nested_attributes_for :vaccine, allow_destroy: true 

  validates :name,presence: true
  validates :race,presence: true
  validates :fur,presence: true
  validates :born_date, date:  { allow_blank: true, message: 'Informe uma data válida'  }

  def self.get_cliente_name cliente_id
    Cliente.find(cliente_id).name
  end

  def self.search(word,filter)
        search_condition = "%" + word + "%"
        
          Pet.where("name LIKE ?
                   OR specie LIKE ?
                   OR race LIKE ?
                   OR sex LIKE ?
                   OR fur LIKE ?
                   OR anamnesis LIKE ?
                   OR historic LIKE ?
                   OR obs LIKE ?",
                  search_condition,
                  search_condition,
                  search_condition,
                  search_condition,
                  search_condition,
                  search_condition,
                  search_condition,
                  search_condition
              )
      
    end

    def self.all_vacs
      vac = []
      Vaccine.attributes.to_a.each do |k,v|
          vac << k if v.to_s == "true" || v.to_s == "false"
      end
      vac
    end

    def self.true_vacs pet
      vac = []
      pet.vaccine.attributes.to_a.each do |k,v|
            vac << k if v.to_s == "true"
        end
        vac
    end

    def self.convert_date date
      date.nil? ? date : Date.strptime(date.to_s, "%Y-%m-%d").strftime("%d/%m/%Y")
    end

    def self.has_leathering pet_id
      false
    end

    def self.all_dog_races
      ['Afghanhound',
      'Airdale terrier',
      'Akita',
      'Basset',
      'Beagle',
      'Bernese',
      'Bichon Frisé',
      'Bloodhound',
      'Border Collie',
      'Boston terrier',
      'Boxer',
      'Buldogue francês',
      'Buldogue inglês',
      'Bull terrier',
      'Cane Corso',
      'Chihuahua',
      'Chow Chow',
      'Cocker Spaniel Americano',
      'Cocker Spaniel Inglês',
      'Collie',
      'Dachshund',
      'Dálmata',
      'Dobermann',
      'Dogo argentino',
      'Dogue alemão',
      'Dogue de Bordeaux',
      'Fila brasileiro',
      'Fox terrier',
      'Golden Retriever',
      'Husky siberiano',
      'Kuvasz',
      'Labrador',
      'Lhasa Apso',
      'Lulu da Pomerânia',
      'Maltês',
      'Mastiff inglês',
      'Mastin napolitano',
      'Mestiço',
      'Old English Sheepdog',
      'Pastor alemão',
      'Pastor belga',
      'Pastor branco',
      'Pelado mexicano',
      'Pequinês',
      'Pinscher',
      'Pointer alemão',
      'Pointer inglês',
      'Poodle',
      'Pug',
      'Rottweiller',
      'Saluki',
      'Samoieda',
      'Schnauzer',
      'Scottish terrier',
      'Setter irlandês',
      'Shar Pei',
      'Shih Tzu',
      'Spitz alemão',
      'SRD',
      'São Bernardo',
      'Terranova',
      'Terrier brasileiro',
      'Weimaraner',
      'Whippet',
      'Yorkshire terrier']
    end

    def self.all_cat_races
      ['Siamês']
    end
end
