class SessionsController < ApplicationController
    
  def new
    if logged?
      redirect_to home_path
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        #Ok
        log_in user
        redirect_to home_path
    else
        flash.now[:danger] = 'Email / Senha incorretos'
        render 'new'
    end
  end

  def reset
    email = params[:reset][:email]
    confirm_email = params[:reset][:confirm_email]
    pass = params[:reset][:password]
    confirm_pass = params[:reset][:confirm_password]
    user = User.find_by_email(email)
    if user.nil? 
      flash.now[:danger] = 'E-mail não cadastrado no sistema'
      return render :new
    end

    unless user && email && confirm_email && pass && confirm_pass && pass == confirm_pass && email == confirm_email &&!pass.empty?
      flash.now[:danger] = 'Informe os dados corretamente'
      render :new
    else
      pass_hash = user.password_digest
      # envia email
      UserMailer.mailto(user,pass).deliver_now

      flash.now[:success] = 'Confirmação enviada para o email !'
      render :new
    end
  end

  def confirm
    email = params[:email]
    pass = params[:pass]
    pass_hash = params[:hash]

    user = User.find_by_email(email)
    
    if user.password_digest == pass_hash && User.update_pass(user.id, pass)
      flash.now[:success] = 'Senha alterada com sucesso !'
      render :new
    else
      flash.now[:danger] = 'Não foi possível alterar a senha !'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  

    private
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

end

