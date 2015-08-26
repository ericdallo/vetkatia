class PetsController < ApplicationController
	before_action :logged_in_user

    def index # pesquisa de pets
        
    end
    ### TO REFACTOR

    def create #novo pet no sistema
        @vaccines = Vaccine.types
        cliente_id = Cliente.where(:name => params[:pet][:cliente]).pluck(:id)

        if cliente_id.blank?
            @pet = Pet.new
            flash[:danger] = "Cliente não encontrado!"
            render 'new'
            return
        end

        params[:pet][:cliente_id] = cliente_id.first
        @pet = Pet.new(pet_params)        
        check_dates
        @pet.build_vaccine(vac_params)

        if @pet.save
          flash[:success] = "Pet cadastrado com sucesso!"
          redirect_to @pet
        else
          render 'new'
        end
    end

    def new
        @vaccines = Vaccine.types
        @pet = Pet.new

        @cliente_name = Cliente.find_by_id(params[:format]).name unless params[:format].nil?
    end


    def show
        @pet = Pet.find(params[:id])
        @vaccines = Pet.true_vacs @pet

    end

    def edit
        @vaccines = Vaccine.types
        @pet = Pet.find(params[:id])
        @cliente_name = Pet.get_cliente_name @pet.cliente_id
        @born_date = Pet.convert_date @pet.born_date
    end

    def update
        @pet = Pet.find(params[:id])
        cliente_id = Cliente.where(:name => params[:pet][:cliente]).pluck(:id)
        if cliente_id.blank?
            flash[:danger] = "Cliente não encontrado!"
            redirect_to edit_pet_path
        else 
            params[:pet][:cliente_id] = cliente_id.first
            check_dates
            @pet.vaccine.assign_attributes(vac_params)
            if @pet.update_attributes(pet_params)
                flash[:success] = "Dados do pet atualizados com sucesso!"
                redirect_to @pet
            else
                redirect_to edit_pet_path
            end    
        end
        
    end

    def destroy
        @pet = Pet.find(params[:id])
        @pet.destroy
        
        flash[:info] = 'Pet ' + @pet.name + ' excluido com sucesso!' 
        redirect_to pets_path
    end

    def search
        @search = nil
        filter = params[:filter]
        @search = Pet.search(params[:search], filter)
        render 'pets/index'
    end

    private
    def pet_params
        params.require(:pet).permit(:name,:specie,:race,:sex,:fur,:born_date,:obs,:cliente_id,:anamnesis,:historic,
            vaccine_attributes: [:v10,:v10_1,:v10_2,:v10_3,:v10_4,:v7,:raiva,:giardia,:pneumodog,:triplice_felina,:triplice_felina_1,:triplice_felina_2,:triplice_felina_raiva,:v10_due_date,:v10_1_due_date,:v10_2_due_date,:v10_3_due_date,:v10_4_due_date,:raiva_due_date,:giardia_due_date,:pneumodog_due_date,:v7_due_date,:triplice_felina_due_date,:triplice_felina_raiva_due_date,:triplice_felina_1_due_date,:triplice_felina_2_due_date]
        )
    end

    private
    def vac_params
        params.require(:pet).require(:vaccine_attributes).permit(:v10,:v10_1,:v10_2,:v10_3,:v10_4,:v7,:raiva,:giardia,:pneumodog,:triplice_felina,:triplice_felina_1,:triplice_felina_2,:triplice_felina_raiva,
            :v10_due_date,:v10_1_due_date,:v10_2_due_date,:v10_3_due_date,:v10_4_due_date,:raiva_due_date,:giardia_due_date,:pneumodog_due_date,:v7_due_date,:triplice_felina_due_date,:triplice_felina_raiva_due_date,:triplice_felina_1_due_date,:triplice_felina_2_due_date)
    end

    def check_dates
        
        vac_params.each do |k,v|
            params[:pet][:vaccine_attributes][k] = Date.today.to_s if k.end_with?('due_date') && v.empty?
        end
    end

end
