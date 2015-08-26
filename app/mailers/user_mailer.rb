class UserMailer < ApplicationMailer

    def mailto(user,password)
        @user = user
        @pass = password
        mail(to: @user.email, subject: "Confirmação de alteração de senha")
    end
end
