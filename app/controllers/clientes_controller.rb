class ClientesController < ApplicationController
    before_action :logged_in_user

    def index # pesquisa de clientes

    end

    def create #novo cliente no sistema
        @cliente = Cliente.new(cliente_params)
        if @cliente.save
          flash[:success] = "Cliente cadastrado com sucesso!"
          redirect_to @cliente
        else
          render 'new'
        end
    end

    def new 
        @cliente = Cliente.new
    end

    def show
        @cliente = Cliente.find(params[:id])
        @exam = Exam.new
    end

    def edit
        @cliente = Cliente.find(params[:id])
    end
    def update
        @cliente = Cliente.find(params[:id])
        if @cliente.update_attributes(cliente_params)
            flash[:success] = "Dados do cliente atualizados com sucesso!"
            redirect_to @cliente
        else
            render 'edit'
        end
    end

    def destroy
        @cliente = Cliente.find(params[:id])
        name = @cliente.name
        Cliente.delete_pets @cliente.id
        @cliente.destroy
        
        flash[:info] = 'Cliente ' + name + ' excluido com sucesso!' 
        redirect_to clientes_path
    end

    def search
        @search = nil
        filter = params[:filter]
        @search = Cliente.search(params[:search], filter)
        render 'clientes/index'
    end

    def send_email
        
        @cliente = Cliente.find(params[:email][:id])
        subject = params[:email][:subject]
        body = params[:email][:body]
        ClientMailer.mailto(@cliente,subject,body).deliver_now

        flash[:info] = "E-mail enviado com sucesso!"
        render :show

    end

    private
    def cliente_params
        params.require(:cliente).permit(:name,:adress,:neighborhood,:city,:state,:cep,:phone,:commercial_phone,:cel,:another_cel,:email,:rg,:cpf)
    end

end
