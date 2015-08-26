class ClientMailer < ApplicationMailer
	

	def mailto(cliente,subject,body)
		@cliente = cliente
		@bod = body
		mail(to: @cliente.email, subject: subject)	
	end
end
