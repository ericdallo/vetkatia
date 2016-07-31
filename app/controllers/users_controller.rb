class UsersController < ApplicationController
    before_action :logged_in_user

    def new

    end

    def edit
        @user = User.find_by_id(current_user.id);
        render 'edit'
    end

    def update
        @user = User.find_by_id(current_user.id);

        pass = params[:user][:password]
        new_pass = params[:user][:new_password]
        confirm_new_pass = params[:user][:confirm_new_password]

        if confirm_same_pass(pass) && confirm_new_pass(new_pass,confirm_new_pass)

            User.update_pass(@current_user.id, new_pass)

            flash[:success] = "Dados de cadastro atualizados com sucesso!"
            redirect_to home_path
        else
            flash[:danger] = "Senha incorreta ou as senhas nao conferem!"
            render :edit
        end

    end

    private
    def confirm_same_pass (confirm_pass)
        if !!@user.authenticate(confirm_pass)
            return true
        end
        return false
    end

    private
    def confirm_new_pass (pass,new_pass)
        if pass == new_pass
            return true
        end
        return false
    end
    private
    def cliente_params
        params.require(:user).permit(:name,:email,:password,:new_password,:confirm_new_password)
    end

end

