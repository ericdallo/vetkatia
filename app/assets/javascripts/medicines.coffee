
$ ->
	$('#sortable').editableTableWidget({
		preventColumns: [ 6 ]
	});
	$('#sortable .btn-excluir').click ->
        $(this).closest('tr').fadeOut 300, ->
        	$(this).remove();

    $('.btn-add').click ->
        $("#sortable .tbody-add").append($('<tr>')
                                        .append($('<td>').text("Adicionando...")).addClass("text-center update blue new")
                                        .append($('<td>').attr("tab-index","1"))
                                        .append($('<td>').attr("tab-index","1"))
                                        .append($('<td>').attr("tab-index","1"))
                                        .append($('<td>').attr("tab-index","1"))
                                        .append($('<td>').attr("tab-index","1"))).append($('</tr>'));
        $('#btn-save').prop("disabled",true);
    

    $('#sortable .new').focus ->
        $(this).css("color","black");
        $(this).removeClass("new");
    
    $('#sortable .edit').focusout ->

        if($(this).text() == "          Linha adicionada        " || $(this).text() == "Linha adicionada")
            $(this).addClass("new");
            $(this).css("color","#00CC00");
        
        