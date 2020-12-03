<div class="panel panel-border panel-info" id="modal_id" xmlns="http://www.w3.org/1999/html">

    <div class="panel-heading">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding-top:10px; padding-right:10px;">×</button>
        <h3 class="panel-title">Traitement Demande</h3><br>
        <hr>
    </div>


                    <div class="panel-body">
                        <form id="form_add_doc" method="post" onsubmit="return validateForm()">
                            <div class="form-body"  id="form">
                                <input type="hidden" name="id_demande" id="id_demande" value="<?php echo $info->id_demande?>" >
                                <div class='form-group' >
                                    <label class='control-label col-md-4'>Etat <span class="text-danger">*</span></label>
                                    <div class='col-md-8'>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="etat" class="attente" value="0" name="etat"  >
                                            <label for="inlineRadio1"> En attente </label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <input type="radio" id="etat" class="valider" value="1" name="etat">
                                            <label for="inlineRadio2"> Valider </label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <input type="radio" id="etat" class="annuler" value="-1" name="etat">
                                            <label for="inlineRadio2"> Annuler </label>
                                        </div></br></br>

                                    </div>
                                </div>

                                <label class="control-label col-md-4">Observation <span class="text-danger">*</span></label>

                                <div class="col-md-8">

                                        <textarea id="observation" name="observation" rows="4" cols="50">
                                        </textarea>

                                </div>

                            </div>

                                <div class="form-group">

                            </div>
                            <div class="form-group col-md-12"></div>
                            <div class="form-group col-md-12 text-right">
                                <a href="#" class="on-default valide" id="valide">
                                    <span class="btn btn-info">Enregistrer</span>
                                </a>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset"  class="btn btn-default"> Annuler</button>
                            </div>
                        </form>
                    </div>


</div>


<script>



    $(document).ready(function (){

        // validate_form('form_add_doc');

        $('#form_add_doc').on('click', '.valide', function () {

            var isvalidate = $('#form_add_doc').valid();

            if(isvalidate){
                $('#modal_add_doc').modal('hide');
                //$('#id_demande').val();
                href ="<?php echo site_url('demande/C_demande/traitement/')?>" +  $('#id_demande').val();
//alert(href);return false;
                var formulaire = $("#form_add_doc");
                $.ajax({
                    url: href,
                    type: 'POST',
                    data: formulaire.serialize(),
                    dataType: 'JSON',
                    success: function (data) {
                       // if (data.status == 'success') {
                            $.Notification.autoHideNotify(data.status, 'bottom right', 'Ajout', data.message);

                            $('#'+menu_encours).click();
                        // }
                        // else {
                        //    // $.LoadingOverlay("hide");
                        //     $.Notification.autoHideNotify(data.status, 'bottom right', 'Donnée non Ajouter', data.message);
                        //     document.getElementById("id_demande").focus();
                        // }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('Error adding data');
                    }
                });
            }
            return false;
        });
        $('.wysihtml5').wysihtml5({
            "link": true, //Button to insert a link. Default true
            "image": true, //Button to insert an image. Default true,
            "color": true, //Button to insert an image. Default true,
            "blockquote": true, //Blockquote
        });
    });
</script>


<?php
