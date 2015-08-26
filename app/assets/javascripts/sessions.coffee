# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
	link = $('#link');
	$('.change-frame').click ->
		$('.flip').toggleClass('flipped');
		link.toggleClass('unflip');
		if link.text() == "Voltar"
			link.text('Esqueceu sua senha ?');
			link.css('left':'210px');
		else
			link.text('Voltar');
			link.css('left':'290px');
		