# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    dogs = {'Option 1':'Afghanhound','Option 2':'Airdale terrier','Option 3':'Akita','Option 4':'Basset','Option 5':'Beagle','Option 6':'Bernese','Option 7':'Bichon Frisé','Option 8':'Bloodhound','Option 9':'Border Collie','Option 10':'Boston terrier','Option 11':'Boxer','Option 12':'Buldogue francês','Option 13':'Buldogue inglês','Option 14':'Bull terrier','Option 15':'Cane Corso','Option 16':'Chihuahua','Option 17':'Chow Chow','Option 18':'Cocker Spaniel Americano','Option 19':'Cocker Spaniel Inglês','Option 20':'Collie','Option 21':'Dachshund','Option 22':'Dálmata','Option 23':'Dobermann','Option 24':'Dogo argentino','Option 25':'Dogue alemão','Option 26':'Dogue de Bordeaux','Option 27':'Fila brasileiro','Option 28':'Fox terrier','Option 29':'Golden Retriever','Option 30':'Husky siberiano','Option 31':'Kuvasz','Option 32':'Labrador','Option 33':'Lhasa Apso','Option 34':'Lulu da Pomerânia','Option 35':'Maltês','Option 36':'Mastiff inglês','Option 37':'Mastin napolitano','Option 38':'Mestiço','Option 39':'Old English Sheepdog','Option 40':'Pastor alemão','Option 41':'Pastor belga','Option 42':'Pastor branco','Option 43':'Pelado mexicano','Option 44':'Pequinês','Option 45':'Pinscher','Option 46':'Pointer alemão','Option 47':'Pointer inglês','Option 48':'Poodle','Option 49':'Pug','Option 50':'Rottweiller','Option 51':'Saluki','Option 52':'Samoieda','Option 53':'Schnauzer','Option 54':'Scottish terrier','Option 55':'Setter irlandês','Option 56':'Shar Pei','Option 57':'Shih Tzu','Option 58':'Spitz alemão','Option 59':'SRD','Option 60':'São Bernardo','Option 61':'Terranova','Option 62':'Terrier brasileiro','Option 63':'Weimaraner','Option 64':'Whippet','Option 65':'Yorkshire terrier'}
    cats = {'Option 1':'Abissínio','Option 2':'Angorá','Option 3':'Balinês','Option 4':'Bobtail americano','Option 5':'Exótico','Option 6':'Gato de Bengala','Option 7':'Himalaio','Option 8':'Maine coon','Option 9':'Manx','Option 10':'Mau egípcio','Option 11':'Mestiço','Option 12':'Munchkin','Option 13':'Pelo curto americano','Option 14':'Pelo curto brasileiro','Option 15':'Pelo curto inglês','Option 16':'Persa','Option 17':'Ragdoll','Option 18':'Sagrado da Birmãnia','Option 19':'Siamês','Option 20':'Sphynx','Option 21':'SRD'}
    formatoData = {dateFormat: 'dd/mm/yy',dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],dayNamesMin: ['D','S','T','Q','Q','S','S','D'],dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],nextText: 'Próximo',prevText: 'Anterior'};
    $('.date').datepicker(formatoData);

    $('.select_race').bind 'focusout change', ->
        specie = $('.select_race');
        races = $('.races');
        races.empty();
        if specie.val() == 'Canina'
            $.each dogs, (value,key) ->
              races.append($("<option></option>")
                 .attr("value", value).text(key));
        else
            $.each cats, (value,key) ->
              races.append($("<option></option>")
                 .attr("value", value).text(key));

    $('.chk').on 'change', ->
        which = $(this).attr("id").split('_').slice(3).join('_');
        inputName = which + "_due_date";

        if $(this).is(':checked')
            $(this).parent().append('<input type="text" class="form-control input-md date" name="pet[vaccine_attributes]['+inputName+']"/>');
            $(this).nextAll('input[type=text]').first().datepicker(formatoData);
        else if $(this).next().is("input")
          $(this).nextAll('input[type=text]').first().remove();
    
            