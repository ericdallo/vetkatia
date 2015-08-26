# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $(".phone").mask("(99) 9999-9999");
    $(".commercial_phone").mask("(99) 9999-9999");
    $(".cep").mask("99999-999");
    $(".cel").mask("(99)99999-9999");
    $(".another_cel").mask("(99)99999-9999");
    $(".rg").numeric();
    $(".cpf").mask("999.999.999-99");

    sub = $('.email-subject');
    bod = $('.email-body');
    send = $('.email-send');
    sub.keyup ->
        if sub.val().length != 0 and bod.val().length != 0
            send.removeClass('disabled');
        else
            send.addClass('disabled');
    bod.keyup ->
        if sub.val().length != 0 and bod.val().length != 0
            send.removeClass('disabled');
        else
            send.addClass('disabled');