class Cliente < ActiveRecord::Base

    before_save { state.upcase! }

    has_many :exams

    validates :name, presence: true,
    length: {maximum: 50}

    validates :adress, presence: true,
    length: {maximum: 50}

    validates :neighborhood, presence: true
    validates :city, presence: true,
    length: {maximum: 30}
    validates :state, presence: true,
    length: {maximum: 2}

    validates :cep, length: {maximum: 10}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, :allow_blank => true,
                        length: {maximum: 50},  
                        format: {with: VALID_EMAIL_REGEX}
                      

    def self.search(word,filter)
        search_condition = "%" + word + "%"
        
            Cliente.where("name LIKE ?
                     OR adress LIKE ?
                     OR neighborhood LIKE ?
                     OR city LIKE ?
                     OR state LIKE ?
                     OR cep LIKE ?
                     OR rg LIKE ?
                     OR cpf LIKE ?
                     OR phone LIKE ?
                     OR commercial_phone LIKE ?
                     OR cel LIKE ?
                     OR another_cel LIKE ?",
                    search_condition,
                    search_condition,
                    search_condition,
                    search_condition,
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

    def self.delete_pets cliente_id

        Pet.where(cliente_id: cliente_id).each do |p|
            Vaccine.where(pet_id: p.id).destroy_all
        end
        Pet.where(cliente_id: cliente_id).destroy_all        
    end

    def self.get_pets id
        Pet.where(cliente_id: id)
    end
end
